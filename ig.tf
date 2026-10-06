resource "yandex_compute_instance_group" "ufilin" {
  name               = "ufilin"
  folder_id          = var.folder_id
  service_account_id = var.service_account_id
  instance_template {
    scheduling_policy {
      preemptible = true
    }
    resources {
      cores         = var.vms_resources.cores
      memory        = var.vms_resources.memory
      core_fraction = var.vms_resources.core_fraction
    }
    boot_disk {
      initialize_params {
        image_id = "fd827b91d99psvq5fjit"
        size     = 20
        type     = "network-ssd"
      }
    }
    network_interface {
      subnet_ids = [yandex_vpc_subnet.public.id]
      nat        = true
    }
    metadata = {
      ssh-keys  = "ubuntu:${file("~/.ssh/id_ed25519.pub")}"
      user-data = <<-EOF
                #!/bin/bash
                cat > /var/www/html/index.html <<'HTML'
                ${file("index.html")}
                HTML
            EOF
    }
  }
  scale_policy {
    fixed_scale {
      size = 3
    }
  }
  allocation_policy {
    zones = [var.default_zone]
  }
  deploy_policy {
    max_unavailable = 1
    max_expansion   = 1
  }
  load_balancer {
    target_group_name = "ufilin"
  }
  health_check {
    http_options {
      port = 80
      path = "/"
    }
  }
}