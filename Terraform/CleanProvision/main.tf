
provider "google" {
  project     = var.project_name
  region      = var.gcp_region_1
  zone        = var.gcp_zone_1
}

resource "google_compute_network" "vpc_network" {
  name                    = "terraform-network"
  auto_create_subnetworks = "true"
}

resource "google_compute_subnetwork" "subnet-a" {
  name          = "subnet-a"
  ip_cidr_range = var.subnet_a_cidr
  region        = var.gcp_region_1
  network       = google_compute_network.vpc_network.id

#   purpose       = "INTERNAL_HTTPS_LOAD_BALANCER"
#   role          = "ACTIVE"

#   secondary_ip_range {
#     range_name    = "tf-test-secondary-range-update1"
#     ip_cidr_range = "192.168.10.0/24"
#   }

}

resource "google_compute_subnetwork" "subnet-b" {
  name          = "subnet-b"
  ip_cidr_range = var.subnet_b_cidr
  region        = var.gcp_region_1
  network       = google_compute_network.vpc_network.id
}

# reserved IP address
resource "google_compute_global_address" "default" {
  provider = google-beta
  name = "static-ip"
}

resource "google_compute_firewall" "terraform-rules" {
  name    = "fw-rules"
  network = "terraform-network"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
#   source_tags = ["lb-backend"]
  target_tags = ["lb-backend"]

}

resource "google_compute_firewall" "tf-rules-http-lb" {
  name = "fw-rules-http"
  network = "terraform-network"

  allow {
      protocol = "tcp"
  }

  target_tags = ["lb-backend"]
  source_ranges = ["130.211.0.0/22", "35.191.0.0/16"]
}

resource "google_compute_default_service_account" "default" {
  
}

data "google_compute_image" "my_image" {
  family  = "debian-9"
  project = "debian-cloud"
}

resource "google_compute_instance_template" "instemplate1" {
  name        = "instance-template1"
  description = "This template is used to create instances."

  tags = ["instance-t1"]

#   labels = {
#     environment = "dev"
#   }

  instance_description = "description assigned to instances"
  machine_type         = "f1-micro"
  can_ip_forward       = false

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  // Create a new boot disk from an image
  disk {
    source_image      = "debian-cloud/debian-9"
    auto_delete       = true
    boot              = true
  }

  network_interface {
    network = "terraform-network"
    subnetwork = "subnet-a"
  }

  metadata = {
    ssh-keys = "${var.gce_ssh_user}:${var.gce_ssh_pub_key_file}"
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    # email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
}

resource "google_compute_instance_template" "instemplate2" {
  name        = "instance-template2"
  description = "This template is used to create instances."

  tags = ["instance-t2"]

#   labels = {
#     environment = "dev"
#   }

  instance_description = "description assigned to instances"
  machine_type         = "f1-micro"
  can_ip_forward       = false

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  // Create a new boot disk from an image
  disk {
    source_image      = "debian-cloud/debian-9"
    auto_delete       = true
    boot              = true
  }

  network_interface {
    network = "terraform-network"
    subnetwork = "subnet-b"
  }

  metadata = {
    ssh-keys = "${var.gce_ssh_user}:${var.gce_ssh_pub_key_file}"
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    # email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
}

# resource "google_compute_instance_group_manager" "instance_group_manager" {
#   name               = "instance-group-manager"
#   instance_template  = google_compute_instance_template.instance_template.id
#   base_instance_name = "instance-group-manager"
#   zone               = "us-central1-f"
#   target_size        = "1"
# }

resource "google_compute_health_check" "autohealing" {
  name                = "autohealing-health-check"
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 10 # 50 seconds

  http_health_check {
    request_path = "/healthz"
    port         = "80"
  }
}

resource "google_compute_instance_group_manager" "mig1" {
  name = "mig1"

  base_instance_name = "inst"
  zone               = var.gcp_zone_1

  version {
    instance_template  = google_compute_instance_template.instemplate1.id
  }

#   target_pools = [google_compute_target_pool.appserver.id]
  target_size  = 2

#   named_port {
#     name = "customHTTP"
#     port = 8888
#   }

  auto_healing_policies {
    health_check      = google_compute_health_check.autohealing.id
    initial_delay_sec = 300
  }
}

resource "google_compute_instance_group_manager" "mig2" {
  name = "mig2"

  base_instance_name = "inst"
  zone               = var.gcp_zone_2

  version {
    instance_template  = google_compute_instance_template.instemplate2.id
  }

#   target_pools = [google_compute_target_pool.appserver.id]
  target_size  = 2

#   named_port {
#     name = "customHTTP"
#     port = 8888
#   }

  auto_healing_policies {
    health_check      = google_compute_health_check.autohealing.id
    initial_delay_sec = 300
  }
}