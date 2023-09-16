resource "google_firestore_document" "benign" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "benign"
  fields      = file("${path.module}/benign.json")
}
