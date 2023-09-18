resource "google_firestore_document" "over" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "over"
  fields      = file("${path.module}/over.json")
}
