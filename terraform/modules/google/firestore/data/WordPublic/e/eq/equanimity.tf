resource "google_firestore_document" "equanimity" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "equanimity"
  fields      = file("${path.module}/equanimity.json")
}
