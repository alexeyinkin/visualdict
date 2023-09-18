resource "google_firestore_document" "state" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "state"
  fields      = file("${path.module}/state.json")
}
