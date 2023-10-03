resource "google_firestore_document" "low-key" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "low-key"
  fields      = file("${path.module}/low-key.json")
}
