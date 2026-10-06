resource "yandex_lb_network_load_balancer" "ufilin_nlb" {
  name = "ufilin-nlb"
  listener {
    name        = "listener-80"
    port        = 80
    protocol    = "tcp"
    target_port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }
  attached_target_group {
    target_group_id = yandex_compute_instance_group.ufilin.load_balancer[0].target_group_id
    healthcheck {
      name = "check-lb"
      http_options {
        port = 80
        path = "/"
      }
    }
  }
}