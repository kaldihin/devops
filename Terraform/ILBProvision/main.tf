# Defining provider and default settings
provider "google" {
  project = var.project_name
  region  = var.gcp_region
  zone    = var.gcp_zone
}

# Defining VPC network
resource "google_compute_network" "vpc_network" {
  name                    = "terraform-network"
  auto_create_subnetworks = "false"
}

# proxy-only subnet
resource "google_compute_subnetwork" "proxy_subnet" {
  name          = "proxy"
  provider      = google-beta
  ip_cidr_range = "10.2.0.0/16"
  region        = var.gcp_region
  purpose       = "INTERNAL_HTTPS_LOAD_BALANCER"
  role          = "ACTIVE"
  network       = google_compute_network.vpc_network.id
}

# backend subnet
resource "google_compute_subnetwork" "backend_subnet" {
  name          = "subnet-a"
  provider      = google-beta
  ip_cidr_range = "10.1.0.0/16"
  region        = var.gcp_region
  network       = google_compute_network.vpc_network.id
}

# allow all access from IAP and health check ranges
resource "google_compute_firewall" "fw-iap" {
  name          = "fw-allow-iap-hc"
  provider      = google-beta
  direction     = "INGRESS"
  network       = google_compute_network.vpc_network.id
  source_ranges = ["130.211.0.0/22", "35.191.0.0/16", "35.235.240.0/20"]
  allow {
    protocol = "tcp"
  }
}

# allow http from proxy subnet to backends
resource "google_compute_firewall" "fw-ilb-to-backends" {
  name          = "fw-allow-ilb-to-backends"
  provider      = google-beta
  direction     = "INGRESS"
  network       = google_compute_network.vpc_network.id
  source_ranges = ["10.2.0.0/16"]
  target_tags   = ["http-server"]
  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "22"]
  }
}

# Defining firewall rules for Ansible host
resource "google_compute_firewall" "firewall_rules" {
  name    = "tf-fw-rules"
  network = "terraform-network"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]

    depends_on = [
      google_compute_network.vpc_network
      ]

}

# forwarding rule
resource "google_compute_forwarding_rule" "google_compute_forwarding_rule" {
  name                  = "forwarding-rule"
  provider              = google-beta
  region                = var.gcp_region
  depends_on            = [google_compute_subnetwork.proxy_subnet]
  ip_protocol           = "TCP"
  load_balancing_scheme = "INTERNAL_MANAGED"
  port_range            = "80"
  target                = google_compute_region_target_http_proxy.target_proxy.id
  network               = google_compute_network.vpc_network.id
  subnetwork            = google_compute_subnetwork.backend_subnet.id
  network_tier          = "PREMIUM"
}

# HTTP target proxy
resource "google_compute_region_target_http_proxy" "target_proxy" {
  name     = "target-http-proxy"
  provider = google-beta
  region   = var.gcp_region
  url_map  = google_compute_region_url_map.reg_url_map.id
}

# URL map
resource "google_compute_region_url_map" "reg_url_map" {
  name            = "regional-url-map"
  provider        = google-beta
  region          = var.gcp_region
  default_service = google_compute_region_backend_service.backend_service.id
}

# Backend service
resource "google_compute_region_backend_service" "backend_service" {
  name                  = "backend-subnet"
  provider              = google-beta
  region                = var.gcp_region
  protocol              = "HTTP"
  load_balancing_scheme = "INTERNAL_MANAGED"
  timeout_sec           = 10
  health_checks         = [google_compute_region_health_check.reg_healthcheck.id]
  backend {
    group           = google_compute_region_instance_group_manager.mig.instance_group
    balancing_mode  = "UTILIZATION"
    capacity_scaler = 1.0
  }
}

# instance template
resource "google_compute_instance_template" "instance_template" {
  name         = "mig-template"
  provider     = google-beta
  machine_type = "e2-small"
  tags         = ["http-server"]

  network_interface {
    network    = google_compute_network.vpc_network.id
    subnetwork = google_compute_subnetwork.backend_subnet.id
    access_config {
      # add external ip to fetch packages
    }
  }
  disk {
    source_image = "debian-cloud/debian-10"
    auto_delete  = true
    boot         = true
  }

  metadata = {
    ssh-keys = "${var.gce_ssh_user}:${var.gce_ssh_pub_key_file}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

# health check
resource "google_compute_region_health_check" "reg_healthcheck" {
  name     = "reg-hc"
  provider = google-beta
  region   = var.gcp_region
  http_health_check {
    port_specification = "USE_SERVING_PORT"
  }
}

# MIG
resource "google_compute_region_instance_group_manager" "mig" {
  name     = "ilb-mig"
  provider = google-beta
  region   = var.gcp_region
  version {
    instance_template = google_compute_instance_template.instance_template.id
    name              = "primary"
  }
  base_instance_name = "vm"
  target_size        = 3
}