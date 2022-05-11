# setup the GCP provider

terraform {
  required_version = ">= 0.12"
}

provider "google" {
  project     = var.project_name
#  credentials = file("kopicloud-tfadmin.json")
  region      = var.gcp_region_1
  zone        = var.gcp_zone_1
}

provider "google-beta" {
  project     = var.project_name
#   credentials = file(var.gcp_auth_file)
  region      = var.gcp_region_1
  zone        = var.gcp_zone_1
}