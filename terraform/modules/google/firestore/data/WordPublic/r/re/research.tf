resource "google_firestore_document" "research" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "research"
  fields      = file("${path.module}/research.json")
}
