resource "google_firestore_document" "however" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "however"
  fields      = file("${path.module}/however.json")
}
