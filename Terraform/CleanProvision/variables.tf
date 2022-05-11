
# Defining GCP user
variable "gce_ssh_user" {
  type    = string
}

# Defining public SSH key for connecting to GCP hosts
variable "gce_ssh_pub_key_file" {
  type    = string
}

variable "project_name" {
  type = string
}

# define GCP region
variable "gcp_region_1" {
  type = string
  description = "GCP region us-central1"
}

# define GCP zone
variable "gcp_zone_1" {
  type = string
  description = "GCP zone us-central1-a"
}

# define GCP zone
variable "gcp_zone_2" {
  type = string
  description = "GCP zone us-central1-b"
}

# define cidr of subnet-a
variable "subnet_a_cidr" {
  type = string
  description = "cidr of subnet-a"
}

# define cidr of subnet-b
variable "subnet_b_cidr" {
  type = string
  description = "cidr of subnet-b"
}