resource "google_compute_firewall" "iap_ssh" {
  name    = "iap-ssh"
  network = data.google_compute_network.default.name

  allow {
    protocol = "tcp"
    ports    = [22]
  }

  source_ranges = ["35.235.240.0/20"]
}