resource "google_firestore_document" "get" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "get"
  fields      = file("${path.module}/get.json")
}
