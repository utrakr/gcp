resource "google_dns_record_set" "spf" {
  name         = google_dns_managed_zone.root.dns_name
  managed_zone = google_dns_managed_zone.root.name
  type         = "TXT"
  ttl          = 300

  rrdatas = ["\"v=spf1 include:spf.improvmx.com ~all\""]
}

resource "google_dns_record_set" "mx" {
  name         = google_dns_managed_zone.root.dns_name
  managed_zone = google_dns_managed_zone.root.name
  type         = "MX"
  ttl          = 300

  rrdatas = [
    "10 mx1.improvmx.com.",
    "20 mx2.improvmx.com.",
  ]
}