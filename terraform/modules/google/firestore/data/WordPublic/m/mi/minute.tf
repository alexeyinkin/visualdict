resource "google_firestore_document" "minute" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "minute"
  fields      = file("${path.module}/minute.json")
}
