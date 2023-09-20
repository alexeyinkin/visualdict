resource "google_firestore_document" "son" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "son"
  fields      = file("${path.module}/son.json")
}
