resource "docker_network" "appnet" {
    name = "appnet"
}
resource "docker_container" "nginx_app1" {
  name  = "nginxapp1"
  image = "nginx:stable-perl"

  ports {
    internal = 80
    external = 8000
  }

  networks_advanced{
    name = docker_network.appnet.name
  }
  networks_advanced{
    name = docker_network.persistencenet.name
  }
}

resource "docker_container" "nginx_app2" {
  name  = "nginxapp2"
  image = "nginx:stable-perl"

  ports {
    internal = 80
    external = 9000
  }

  networks_advanced{
    name = docker_network.appnet.name
  }
  networks_advanced{
    name = docker_network.persistencenet.name
  }
}

resource "docker_container" "nginx_app3" {
  name  = "nginxapp3"
  image = "nginx:stable-perl"

  ports {
    internal = 80
    external = 10000
  }

  networks_advanced{
    name = docker_network.appnet.name
  }
  networks_advanced{
    name = docker_network.persistencenet.name
  }
}
