resource "google_firestore_document" "hand" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "hand"
  fields      = file("${path.module}/hand.json")
}
