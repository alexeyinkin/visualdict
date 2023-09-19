resource "google_firestore_document" "health" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "health"
  fields      = file("${path.module}/health.json")
}
