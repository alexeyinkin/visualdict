resource "google_firestore_document" "fall" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "fall"
  fields      = file("${path.module}/fall.json")
}
