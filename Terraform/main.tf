
# Defining provider and resources

provider "google" {

  # Don't forget to change PROJECT property

  project = var.project_name
  region  = "us-central1"
  zone    = "us-central1-c"
}

# resource "google_compute_instance" "vm_instance" {
#   name         = "terraform-instance${count.index + 1}"
#   machine_type = "f1-micro"
#   count        = 3

#   boot_disk {
#     initialize_params {
#       image = "debian-cloud/debian-9"
#     }
#   }

#   network_interface {
#     network = google_compute_network.vpc_network.self_link
#     access_config {
#     }
#   }

#   metadata = {
#     ssh-keys = "${var.gce_ssh_user}:${var.gce_ssh_pub_key_file}"
#   }

# }

resource "google_compute_network" "vpc_network" {
  name                    = "terraform-network"
  auto_create_subnetworks = "true"
}

# resource "google_compute_autoscaler" "foobar" {
#   name    = "my-autoscaler"
#   project = var.project_name
#   zone    = "us-central1-c"
#   target  = google_compute_instance_group_manager.foobar.self_link

#   autoscaling_policy {
#     max_replicas    = 3
#     min_replicas    = 2
#     cooldown_period = 60

#     cpu_utilization {
#       target = 0.5
#     }
#   }
# }

resource "google_compute_instance_template" "foobar" {
  name           = "my-instance-template"
  machine_type   = "n1-standard-1"
  can_ip_forward = false
  project        = var.project_name
  tags           = ["foo", "bar", "allow-lb-service"]

  disk {
    source_image = data.google_compute_image.debian-9.self_link
  }

  network_interface {
    network = google_compute_network.vpc_network.name
  }

  metadata = {
    foo = "bar"
    ssh-keys = "${var.gce_ssh_user}:${var.gce_ssh_pub_key_file}"
  }

  service_account {
    scopes = ["676527764190-compute@developer.gserviceaccount.com", "compute-ro", "storage-ro"]
  }

}

resource "google_compute_target_pool" "foobar" {
  name    = "my-target-pool"
  project = var.project_name
  region  = "us-central1"
}

resource "google_compute_instance_group_manager" "foobar" {
  name    = "my-igm"
  zone    = "us-central1-c"
  project = var.project_name
  version {
    instance_template = google_compute_instance_template.foobar.self_link
    name              = "primary"
  }

  target_pools       = [google_compute_target_pool.foobar.self_link]
  base_instance_name = "terraform"
}

data "google_compute_image" "debian-9" {
  family  = "debian-9"
  project = "debian-cloud"
}

module "lb" {
  source       = "GoogleCloudPlatform/lb/google"
#  version      = "2.2.0"
  region       = "us-central1"
  name         = "load-balancer"
  service_port = 80
  target_tags  = ["my-target-pool"]
  network      = google_compute_network.vpc_network.name
}

resource "google_compute_firewall" "terraform-rules" {
  name    = "my-firewall"
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

}
