provider "google" {
  project = "utrakr"
  region  = "us-central1"
  version = "~> 3.20"
}

terraform {
  required_version = "~> 0.12"
}

resource "google_storage_bucket" "terrform-state" {
  name     = "utrakr-all"
  location = "us-central1"
  versioning {
    enabled = true
  }
}
