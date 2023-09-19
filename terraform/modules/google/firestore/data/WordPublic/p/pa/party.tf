resource "google_firestore_document" "party" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "party"
  fields      = file("${path.module}/party.json")
}
