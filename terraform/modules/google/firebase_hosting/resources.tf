resource "google_firebase_hosting_site" "default" {
  provider = google-beta
  project  = var.PROJECT
  site_id  = var.PROJECT
}

resource "google_firebase_hosting_channel" "live" {
  provider   = google-beta
  site_id    = google_firebase_hosting_site.default.site_id
  channel_id = "live"
}
