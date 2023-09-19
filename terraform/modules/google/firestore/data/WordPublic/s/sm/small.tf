resource "google_firestore_document" "small" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "small"
  fields      = file("${path.module}/small.json")
}
