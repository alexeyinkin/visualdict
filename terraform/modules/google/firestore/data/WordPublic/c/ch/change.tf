resource "google_firestore_document" "change" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "change"
  fields      = file("${path.module}/change.json")
}
