resource "google_firestore_document" "since" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "since"
  fields      = file("${path.module}/since.json")
}
