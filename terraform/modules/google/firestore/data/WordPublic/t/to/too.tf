resource "google_firestore_document" "too" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "too"
  fields      = file("${path.module}/too.json")
}
