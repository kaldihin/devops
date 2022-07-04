# Outputs | vm-output.tf

output "lb-static-ip" {
  value = google_compute_forwarding_rule.google_compute_forwarding_rule.ip_address
}