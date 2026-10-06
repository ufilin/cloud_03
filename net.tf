## Create networks

resource "yandex_vpc_network" "net" {
  name = "net"
}

resource "yandex_vpc_subnet" "public" {
  name           = "public"
  zone           = var.default_zone
  network_id     = yandex_vpc_network.net.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

/*
## image for all VM

data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2404-lts"
}

## Create VM for public network

resource "yandex_compute_instance" "public-vm" {
  name                      = "public-vm"
  hostname                  = "public-vm"
  allow_stopping_for_update = true
  resources {
    cores         = var.vms_resources.cores
    memory        = var.vms_resources.memory
    core_fraction = var.vms_resources.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      size     = 20
      type     = "network-ssd"
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    nat       = true
  }
  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_ed25519.pub")}"
  }
  scheduling_policy {
    preemptible = true
  }
}
*/