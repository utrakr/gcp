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

output "cloud_functions_connector_region" {
  value = google_vpc_access_connector.connector.region
}