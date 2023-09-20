resource "google_firestore_document" "low" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "low"
  fields      = file("${path.module}/low.json")
}
