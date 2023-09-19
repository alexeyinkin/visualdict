resource "google_firestore_document" "best" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "best"
  fields      = file("${path.module}/best.json")
}
