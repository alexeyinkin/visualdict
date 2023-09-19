resource "google_firestore_document" "probably" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "probably"
  fields      = file("${path.module}/probably.json")
}
