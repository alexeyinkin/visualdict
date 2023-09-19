resource "google_firestore_document" "read" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "read"
  fields      = file("${path.module}/read.json")
}
