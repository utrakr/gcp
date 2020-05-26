resource "google_compute_firewall" "app_traefik_access" {
  name    = "traefik-access"
  network = data.google_compute_network.default.name

  allow {
    protocol = "tcp"
    ports    = [8080]
  }

  target_tags = ["traefik-server"]
}