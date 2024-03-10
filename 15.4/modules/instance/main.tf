resource "yandex_compute_instance" "default" {
  name        = var.name
  platform_id = "standard-v3"

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }

  scheduling_policy {
    preemptible = true
  }

  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      size     = 6
      type     = "network-ssd"
      image_id = var.image
    }
  }

  network_interface {
    subnet_id  = var.subnet
    ip_address = var.ip != "" ? var.ip : null
    nat        = var.nat
  }

  metadata = {
    ssh-keys  = var.sshkey
    user-data = var.userdata != "" ? var.userdata : null
  }
}
