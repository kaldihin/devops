# Virtual machine output | vm-output.tf

output "vm1-ip" {
  value = google_compute_instance.vm1.network_interface.0.access_config.0.nat_ip
}

output "vm2-ip" {
  value = google_compute_instance.vm2.network_interface.0.access_config.0.nat_ip
}

output "vm3-ip" {
  value = google_compute_instance.vm3.network_interface.0.access_config.0.nat_ip
}

output "lb-static-ip" {
  value = google_compute_global_address.static_ip.address
}