terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.23.1"
    }
  }
}

provider "docker" {
  host = "tcp://localhost:2375"
  #host = "unix:///var/run/docker.sock" # Docker on ubuntu connection
}

# Ultima Imagem com Tag "latest".
resource "docker_image" "ubuntu" {
  name = "ubuntu:latest"
}

# Criando Docker com Ubuntu.
resource "docker_container" "webserver" {
  image             = docker_image.ubuntu.latest
  name              = "terraform-docker-test"
  must_run          = true
  publish_all_ports = true
  command = [
    "tail",
    "-f",
    "/dev/null"
  ]
}
# Criando Docker com Nginx.
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "nginx-test"
  ports {
    internal = 80
    external = 8000
  }
}

resource "docker_network" "private_network" {
  name = "my_network"
}

# Use "docker swarm init" ou "docker swarm join" para conectar.
#resource "docker_secret" "foo" {
#  name = "foo"
#  data = base64encode("{\"foo\": \"s3cr3t\"}")
#}

resource "docker_volume" "shared_volume" {
  name = "shared_volume"
}

# A imagem deve existir na máquina que executa o daemon do docker.
#resource "docker_tag" "tag" {
#  source_image = "xxxx"
#  target_image = "xxxx"
#}
