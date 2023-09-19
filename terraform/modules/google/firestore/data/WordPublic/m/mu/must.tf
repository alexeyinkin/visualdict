resource "google_firestore_document" "must" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "must"
  fields      = file("${path.module}/must.json")
}
