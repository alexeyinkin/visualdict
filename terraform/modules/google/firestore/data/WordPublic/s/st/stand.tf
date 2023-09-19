resource "google_firestore_document" "stand" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "stand"
  fields      = file("${path.module}/stand.json")
}
