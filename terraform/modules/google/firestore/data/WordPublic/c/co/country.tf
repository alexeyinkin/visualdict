resource "google_firestore_document" "country" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "country"
  fields      = file("${path.module}/country.json")
}
