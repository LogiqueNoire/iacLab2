resource "docker_container" "proxy" {
  name = "nginx_proxy"
  image = "nginx:stable-perl"

  ports {
    external = 3000
    internal = 80
  }

  networks_advanced {
    name = docker_network.labnet.name
  }

  volumes {
    host_path       = abspath("${path.module}/../host_volumes/nginx_conf")
    container_path  = "/etc/nginx/conf.d"
    read_only       = false
  }
  volumes {
    host_path       = abspath("${path.module}/../host_volumes/web")
    container_path  = "/usr/share/nginx/html"
    read_only       = false
  }

}