resource "google_firestore_document" "at" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "at"
  fields      = file("${path.module}/at.json")
}
