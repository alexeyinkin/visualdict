resource "google_firestore_document" "next" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "next"
  fields      = file("${path.module}/next.json")
}
