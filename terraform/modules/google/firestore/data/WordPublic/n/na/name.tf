resource "google_firestore_document" "name" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "name"
  fields      = file("${path.module}/name.json")
}
