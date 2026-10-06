###cloud vars
variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vms_resources" {
  type = object({
    cores         = number
    memory        = number
    core_fraction = number
  })

  default = {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }
}
variable "ufilin_bucket_access_key" {
  type        = string
  description = "Access key for Yandex Storage Bucket"
}

variable "ufilin_bucket_secret_key" {
  type        = string
  description = "Secret key for Yandex Storage Bucket"
}
variable "service_account_id" {
  type        = string
  description = "Service account ID for Yandex Cloud"
}