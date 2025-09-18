resource "docker_network" "grafananet" {
    name = "grafananet"
}

resource "docker_container" "grafana_dev"{
    name = "grafana_dev"
    image = "grafana/grafana:main-ubuntu"
    ports {
        internal =  3000
        external =  3001
    }

    networks_advanced{
        name = docker_network.grafananet.name
    }
    networks_advanced{
        name = docker_network.appnet.name
    }
}