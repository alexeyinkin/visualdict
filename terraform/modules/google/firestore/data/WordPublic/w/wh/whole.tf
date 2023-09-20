resource "google_firestore_document" "whole" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "whole"
  fields      = file("${path.module}/whole.json")
}
