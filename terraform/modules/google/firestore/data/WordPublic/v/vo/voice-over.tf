resource "google_firestore_document" "voice-over" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "voice-over"
  fields      = file("${path.module}/voice-over.json")
}
