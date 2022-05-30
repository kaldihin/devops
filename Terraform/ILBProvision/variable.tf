# Defining GCP user
variable "gce_ssh_user" {
  type = string
}

# Defining public SSH key for connecting to GCP hosts
variable "gce_ssh_pub_key_file" {
  type = string
}

variable "project_name" {
  type = string
}

# define GCP region
variable "gcp_region" {
  type        = string
  description = "GCP region us-central1"
}

# define GCP zone
variable "gcp_zone" {
  type        = string
  description = "GCP zone us-central1-a"
}