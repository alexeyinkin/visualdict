resource "google_firestore_document" "eye" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "eye"
  fields      = file("${path.module}/eye.json")
}
