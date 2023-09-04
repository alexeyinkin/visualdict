resource "google_firestore_document" "them" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "them"
  fields      = file("${path.module}/them.json")
}
