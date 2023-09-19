resource "google_firestore_document" "game" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "game"
  fields      = file("${path.module}/game.json")
}
