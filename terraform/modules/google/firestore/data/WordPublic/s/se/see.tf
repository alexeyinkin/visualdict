resource "google_firestore_document" "see" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "see"
  fields      = file("${path.module}/see.json")
}
