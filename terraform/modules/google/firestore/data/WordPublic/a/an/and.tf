resource "google_firestore_document" "and" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "and"
  fields      = file("${path.module}/and.json")
}
