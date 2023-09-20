resource "google_firestore_document" "event" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "event"
  fields      = file("${path.module}/event.json")
}
