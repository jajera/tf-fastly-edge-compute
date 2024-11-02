resource "random_pet" "service_name" {
  length = 3 # Generate a three-word name
}

locals {
  service_name = "${random_pet.service_name.id}.edgecompute.app"
}

data "fastly_package_hash" "example" {
  filename = "${path.module}/external/tf-fastly-edge-compute/pkg/tf-fastly-edge-compute.tar.gz"
}

resource "fastly_service_compute" "example" {
  name = "demofastly"

  domain {
    name    = local.service_name
  }

  # activate = false
  package {
    filename         = data.fastly_package_hash.example.filename
    source_code_hash = data.fastly_package_hash.example.hash
  }

  # Define the backend
  backend {
    name            = "local_backend"
    address         = "127.0.0.1"
    port            = 80
    use_ssl         = false  # Set to true if you want to use SSL
    connect_timeout = 1000   # Timeout in milliseconds
    first_byte_timeout = 15000
    between_bytes_timeout = 10000
  }

  force_destroy = true
}

output "fastly_service" {
  value = {
    service_name   = local.service_name
    activate       = fastly_service_compute.example.activate
    active_version = fastly_service_compute.example.active_version
  }
}
