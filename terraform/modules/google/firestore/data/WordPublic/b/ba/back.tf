resource "google_firestore_document" "back" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "back"
  fields      = file("${path.module}/back.json")
}
