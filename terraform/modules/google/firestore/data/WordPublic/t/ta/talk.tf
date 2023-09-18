resource "google_firestore_document" "talk" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "talk"
  fields      = file("${path.module}/talk.json")
}
