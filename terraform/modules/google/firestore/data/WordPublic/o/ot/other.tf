resource "google_firestore_document" "other" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "other"
  fields      = file("${path.module}/other.json")
}
