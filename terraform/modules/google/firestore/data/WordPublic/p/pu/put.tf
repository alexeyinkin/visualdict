resource "google_firestore_document" "put" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "put"
  fields      = file("${path.module}/put.json")
}
