resource "yandex_compute_instance" "node_foreach" {
  for_each                  = var.nodes["stage"]
  name                      = "${each.key}"
  zone                      = "ru-central1-a"
  allow_stopping_for_update = true

  resources {
    cores  = each.value.cores
    memory = each.value.memory
  }

  boot_disk {
    initialize_params {
      image_id = "${var.centos-7-base}"
      type     = each.value.type_disk
      size     = "50"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.default.id}"
    nat       = true
  }

  lifecycle {
    create_before_destroy = true
  }
}