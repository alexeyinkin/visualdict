resource "google_firestore_document" "their" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "their"
  fields      = file("${path.module}/their.json")
}
