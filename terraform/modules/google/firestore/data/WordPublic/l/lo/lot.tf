resource "google_firestore_document" "lot" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "lot"
  fields      = file("${path.module}/lot.json")
}
