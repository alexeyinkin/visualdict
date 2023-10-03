resource "google_firestore_document" "ire" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "ire"
  fields      = file("${path.module}/ire.json")
}
