resource "google_firestore_document" "result" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "result"
  fields      = file("${path.module}/result.json")
}
