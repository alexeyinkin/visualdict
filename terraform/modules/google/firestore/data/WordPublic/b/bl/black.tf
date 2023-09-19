resource "google_firestore_document" "black" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "black"
  fields      = file("${path.module}/black.json")
}
