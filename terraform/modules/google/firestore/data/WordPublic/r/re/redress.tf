resource "google_firestore_document" "redress" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "redress"
  fields      = file("${path.module}/redress.json")
}
