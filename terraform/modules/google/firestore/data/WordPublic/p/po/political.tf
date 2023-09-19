resource "google_firestore_document" "political" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "political"
  fields      = file("${path.module}/political.json")
}
