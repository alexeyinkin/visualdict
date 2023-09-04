resource "google_firestore_document" "time" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "time"
  fields      = file("${path.module}/time.json")
}
