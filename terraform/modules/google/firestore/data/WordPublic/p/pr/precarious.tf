resource "google_firestore_document" "precarious" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "precarious"
  fields      = file("${path.module}/precarious.json")
}
