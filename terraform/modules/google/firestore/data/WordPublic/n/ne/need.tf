resource "google_firestore_document" "need" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "need"
  fields      = file("${path.module}/need.json")
}
