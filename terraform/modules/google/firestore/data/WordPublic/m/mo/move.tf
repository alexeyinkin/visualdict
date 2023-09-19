resource "google_firestore_document" "move" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "move"
  fields      = file("${path.module}/move.json")
}
