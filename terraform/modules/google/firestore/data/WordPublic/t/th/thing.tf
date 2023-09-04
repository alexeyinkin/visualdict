resource "google_firestore_document" "thing" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "thing"
  fields      = file("${path.module}/thing.json")
}
