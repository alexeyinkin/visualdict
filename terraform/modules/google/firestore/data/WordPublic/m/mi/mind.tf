resource "google_firestore_document" "mind" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "mind"
  fields      = file("${path.module}/mind.json")
}
