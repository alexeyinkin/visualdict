resource "google_firestore_document" "serve" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "serve"
  fields      = file("${path.module}/serve.json")
}
