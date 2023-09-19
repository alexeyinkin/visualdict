resource "google_firestore_document" "hour" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "hour"
  fields      = file("${path.module}/hour.json")
}
