
# Defining GCP user

variable "gce_ssh_user" {
  type    = string
  default = "geniy9494"
}

# Defining public SSH key for connecting to GCP hosts

variable "gce_ssh_pub_key_file" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDEcDbLn6Orrd15YsivBdKaWTy3eCGGzNTmQ/kgU7MFeHId//+8iHC88665PRfHahEc5yO+LsURvQdtDkBWCICF8Bc5QSRCr5EkIpc9heY7TJK3EkYKKQ1Iab9fU/QnwIfqtUZBnXpmrxG3jSQMv2R5UYYauf6oRuJ7cor2t0NuRpt693QYjAgo6dfH+z6i+FXeCbFc1Y0LIWgouYoVV0l0bn5ExF7wKBVfmaOREmK03HRLks95dGy9phB5/0XwVokl6JIqF6OozcSAd2zaAdJVxETzQZujT1p3YKePx/XCS+hdQRRoaTFJNbNyDGDXWRz1xVWLSs50yXzsTwcoMM41 geniy9494"
}

variable "project_name" {
  type = string
  default = "boxwood-yen-347112"
}