output "ext_ip" {
  value = yandex_compute_instance.default.network_interface.0.nat_ip_address
}

output "int_ip" {
  value = yandex_compute_instance.default.network_interface.0.ip_address
}