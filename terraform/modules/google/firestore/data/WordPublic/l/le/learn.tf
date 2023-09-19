resource "google_firestore_document" "learn" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "learn"
  fields      = file("${path.module}/learn.json")
}
