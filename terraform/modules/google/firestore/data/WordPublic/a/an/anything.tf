resource "google_firestore_document" "anything" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "anything"
  fields      = file("${path.module}/anything.json")
}
