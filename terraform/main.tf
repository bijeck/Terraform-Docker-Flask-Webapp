terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.16.0"
    }
  }
}

provider "docker" {
  host    = "npipe:////.//pipe//docker_engine"
}

resource "docker_container" "webapp" {
  image = "webapp:latest"
  name  = "webapp"
  ports {
    internal = 5000
    external = 5000
  }
}