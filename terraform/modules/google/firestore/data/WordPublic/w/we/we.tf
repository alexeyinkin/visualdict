resource "google_firestore_document" "we" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "we"
  fields      = file("${path.module}/we.json")
}
