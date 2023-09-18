resource "google_firestore_document" "right" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "right"
  fields      = file("${path.module}/right.json")
}
