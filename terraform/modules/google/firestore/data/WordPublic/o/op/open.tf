resource "google_firestore_document" "open" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "open"
  fields      = file("${path.module}/open.json")
}
