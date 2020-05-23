resource "google_dns_record_set" "github_challenge" {
  name         = "_github-challenge-utrakr.${google_dns_managed_zone.root.dns_name}"
  managed_zone = google_dns_managed_zone.root.name
  type         = "TXT"
  ttl          = 300

  rrdatas = ["eb3a0ac9a4"]
}
