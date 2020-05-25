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
    prefix = "vpc"
  }
}

data "google_compute_network" "default" {
  name = "default"
}

data "google_compute_subnetwork" "default" {
  name   = "default"
  region = "us-central1"
}

output "google_compute_network_default" {
  value = data.google_compute_network.default
}

output "google_compute_subnetwork_default" {
  value = data.google_compute_subnetwork.default
}