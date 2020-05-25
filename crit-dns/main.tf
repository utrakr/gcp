provider "google" {
  project = "utrakr"
  region  = "us-central1"
  version = "~> 3.20"
}

terraform {
  required_version = "~> 0.12"
}

terraform {
  required_version = "~> 0.12"
  backend "gcs" {
    bucket = "utrakr-all-terraform-state"
    prefix = "crit-dns"
  }
}

output "google_dns_managed_zone_root" {
  value = google_dns_managed_zone.root
}