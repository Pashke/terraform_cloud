output "internal_ip_address_node_foreach_yandex_cloud" {
  value = "${yandex_compute_instance.node_foreach[*].network_interface.0.ip_address}"
}

output "external_ip_address_node_foreach_yandex_cloud" {
  value = "${yandex_compute_instance.node_foreach[*].network_interface.0.nat_ip_address}"
}