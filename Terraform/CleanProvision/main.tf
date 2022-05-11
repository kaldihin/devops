
provider "google" {
  project     = var.project_name
  region      = var.gcp_region_1
  zone        = var.gcp_zone_1
}

resource "google_compute_network" "vpc_network" {
  name                    = "terraform-network"
  auto_create_subnetworks = "true"
}

