resource "google_firestore_document" "sure" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "sure"
  fields      = file("${path.module}/sure.json")
}
