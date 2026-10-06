resource "yandex_storage_bucket" "ufilin_bucket" {
  bucket     = "ufilin-bucket-061026"
  access_key = var.ufilin_bucket_access_key
  secret_key = var.ufilin_bucket_secret_key
  max_size   = 1024000000
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
        kms_master_key_id = yandex_kms_symmetric_key.ufilin_kms_key.id
      }
    }
  }
}

resource "yandex_storage_object" "ufilin_object" {
  bucket       = yandex_storage_bucket.ufilin_bucket.bucket
  key          = "file.jpeg"
  access_key   = var.ufilin_bucket_access_key
  secret_key   = var.ufilin_bucket_secret_key
  source       = "./images/file.jpeg"
  content_type = "image/jpeg"
  acl          = "public-read"
}