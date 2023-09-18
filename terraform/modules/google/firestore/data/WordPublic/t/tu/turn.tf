resource "google_firestore_document" "turn" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "turn"
  fields      = file("${path.module}/turn.json")
}
