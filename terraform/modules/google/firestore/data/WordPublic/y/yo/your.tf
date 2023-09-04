resource "google_firestore_document" "your" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "your"
  fields      = file("${path.module}/your.json")
}
