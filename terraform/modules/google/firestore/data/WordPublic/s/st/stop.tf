resource "google_firestore_document" "stop" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "stop"
  fields      = file("${path.module}/stop.json")
}
