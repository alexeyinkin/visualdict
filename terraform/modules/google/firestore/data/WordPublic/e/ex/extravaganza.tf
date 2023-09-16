resource "google_firestore_document" "extravaganza" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "extravaganza"
  fields      = file("${path.module}/extravaganza.json")
}
