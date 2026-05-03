terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.6"
    }
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.201"
    }
  }
  required_version = "~> 1.14"
}
