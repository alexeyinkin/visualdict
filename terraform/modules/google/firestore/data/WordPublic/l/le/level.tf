resource "google_firestore_document" "level" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "level"
  fields      = file("${path.module}/level.json")
}
