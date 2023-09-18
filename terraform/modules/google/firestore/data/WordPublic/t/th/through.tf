resource "google_firestore_document" "through" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "through"
  fields      = file("${path.module}/through.json")
}
