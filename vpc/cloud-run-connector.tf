data "google_compute_network" "default" {
  name = "default"
}

data "google_compute_subnetwork" "default" {
  name   = "default"
  region = "us-central1"
}

resource "google_vpc_access_connector" "connector" {
  name          = "cloud-run-access"
  region        = data.google_compute_subnetwork.default.region
  ip_cidr_range = "10.10.10.0/28" // should not be in the default range 10.128.0.0/9
  network       = data.google_compute_network.default.name

  min_throughput = 200
  max_throughput = 300
}

resource "google_compute_firewall" "connector_allow" {
  name    = "${google_vpc_access_connector.connector.name}-allow"
  network = data.google_compute_network.default.self_link

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  source_ranges = toset([google_vpc_access_connector.connector.ip_cidr_range])
}
