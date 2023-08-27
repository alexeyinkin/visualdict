resource "google_firestore_document" "incipient" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "incipient"
  fields      = file("${path.module}/incipient.json")
}
