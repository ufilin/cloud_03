output "html_page" {
  value = [
    { html = [
      "curl -I https://storage.yandexcloud.net/${yandex_storage_bucket.ufilin_bucket.bucket}/${yandex_storage_object.ufilin_object.key}"
      ]
    }
  ]
}
output "lb_ip" {
  value = [
    { ip_lb = [
      tolist(tolist(yandex_lb_network_load_balancer.ufilin_nlb.listener)[0].external_address_spec)[0].address
      ]
    }
  ]
}