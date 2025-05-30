terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "nginx_image" {
  name = "nginx:latest"
}

resource "docker_container" "nginx_container" {
  name  = "my_nginx"
  image = docker_image.nginx_image.name   # <-- FIXED THIS LINE
  ports {
    internal = 80
    external = 8080
  }
}
