resource "google_firestore_document" "great" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "great"
  fields      = file("${path.module}/great.json")
}
