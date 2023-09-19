resource "google_firestore_document" "together" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "together"
  fields      = file("${path.module}/together.json")
}
