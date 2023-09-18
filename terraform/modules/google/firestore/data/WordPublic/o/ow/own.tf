resource "google_firestore_document" "own" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "own"
  fields      = file("${path.module}/own.json")
}
