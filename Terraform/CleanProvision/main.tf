# Defining provider and default settings
provider "google" {
  project = var.project_name
  region  = var.gcp_region
  zone    = var.gcp_zone
}

# Defining VPC network
resource "google_compute_network" "vpc_network" {
  name                    = "terraform-network"
  auto_create_subnetworks = "true"
}

# Defining firewall rules
resource "google_compute_firewall" "firewall_rules" {
  name    = "tf-fw-rules"
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

    depends_on = [
      google_compute_network.vpc_network
      ]

}

# Defining default image
data "google_compute_image" "debian_image" {
  family  = "debian-10"
  project = "debian-cloud"
}


resource "google_compute_instance_template" "instance_template" {
  name_prefix  = "tf-vm"
  machine_type = "e2-small"
  region       = "us-central1"
  zone         = var.gcp_zone

  boot_disk {
    initialize_params {
      image = data.google_compute_image.debian_image.self_link
    }
  }

  network_interface {
    network = "terraform-network"

    access_config {

    }
  }


  metadata = {
    ssh-keys = "${var.gce_ssh_user}:${var.gce_ssh_pub_key_file}"
  }

      depends_on = [
      google_compute_network.vpc_network
      ]
}

resource "google_compute_instance_group_manager" "instance_group_manager" {
  name               = "instance-group-manager"
  instance_template  = google_compute_instance_template.instance_template.id
  base_instance_name = "tf-vm"
  zone               = "us-central1-a"
  target_size        = "3"
}



# # Defining first vm1
# resource "google_compute_instance" "vm1" {
#   name         = "tf-vm1"
#   machine_type = "e2-small"
#   zone         = var.gcp_zone
#   boot_disk {
#     initialize_params {
#       image = data.google_compute_image.debian_image.self_link
#     }
#   }

#   network_interface {
#     network = "terraform-network"

#     access_config {

#     }
#   }

#   metadata = {
#     ssh-keys = "${var.gce_ssh_user}:${var.gce_ssh_pub_key_file}"
#   }

#       depends_on = [
#       google_compute_network.vpc_network
#       ]

# }

# # Defining first vm2
# resource "google_compute_instance" "vm2" {
#   name         = "tf-vm2"
#   machine_type = "e2-small"
#   zone         = var.gcp_zone
#   boot_disk {
#     initialize_params {
#       image = data.google_compute_image.debian_image.self_link
#     }
#   }

#   network_interface {
#     network = "terraform-network"
#     access_config {

#     }
#   }

#   metadata = {
#     ssh-keys = "${var.gce_ssh_user}:${var.gce_ssh_pub_key_file}"
#   }

#       depends_on = [
#       google_compute_network.vpc_network
#       ]
# }

# # Defining first vm3
# resource "google_compute_instance" "vm3" {
#   name         = "tf-vm3"
#   machine_type = "e2-small"
#   zone         = var.gcp_zone
#   boot_disk {
#     initialize_params {
#       image = data.google_compute_image.debian_image.self_link
#     }
#   }

#   network_interface {
#     network = "terraform-network"
#     access_config {

#     }
#   }

#   metadata = {
#     ssh-keys = "${var.gce_ssh_user}:${var.gce_ssh_pub_key_file}"
#   }

#       depends_on = [
#       google_compute_network.vpc_network
#       ]
# }

# Creating instance group
resource "google_compute_instance_group" "instance_group" {
  name = "tf-instance-group"
  zone = var.gcp_zone
  instances = [google_compute_instance.tf-vm1.id,
    google_compute_instance.tf-vm2.id,
  google_compute_instance.tf-vm3.id, ]

  named_port {
    name = "http"
    port = "80"
  }

  lifecycle {
    create_before_destroy = true
  }

      depends_on = [
      google_compute_network.vpc_network
      ]
}

# Reserving static IP address
resource "google_compute_global_address" "static_ip" {
  provider = google-beta
  name     = "tf-static-ip"
}

# Creating forwarding rule
resource "google_compute_global_forwarding_rule" "forward_rule" {
  name       = "fw-rule-port-80"
  ip_address = google_compute_global_address.static_ip.address
  port_range = "80"
  target     = google_compute_target_http_proxy.http_proxy.self_link
}

# Creating URL map
resource "google_compute_url_map" "url_map" {
  name            = "url-map"
  default_service = google_compute_backend_service.backend_service.self_link
}

# Creating http proxy
resource "google_compute_target_http_proxy" "http_proxy" {
  name    = "http-proxy"
  url_map = google_compute_url_map.url_map.self_link
}

# Defining backend service
resource "google_compute_backend_service" "backend_service" {
  name      = "tf-backend-service"
  port_name = "http"
  protocol  = "HTTP"

  backend {
    group = google_compute_instance_group.instance_group.id
  }

  health_checks = [
    google_compute_http_health_check.healthcheck.id
  ]
}

# Defining health check
resource "google_compute_http_health_check" "healthcheck" {
  name         = "tf-healthcheck"
  request_path = "/"

  timeout_sec        = 1
  check_interval_sec = 1
}