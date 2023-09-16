resource "google_firestore_document" "evince" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "evince"
  fields      = file("${path.module}/evince.json")
}
