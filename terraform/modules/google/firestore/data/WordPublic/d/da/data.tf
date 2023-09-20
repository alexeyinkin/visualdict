resource "google_firestore_document" "data" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "data"
  fields      = file("${path.module}/data.json")
}
