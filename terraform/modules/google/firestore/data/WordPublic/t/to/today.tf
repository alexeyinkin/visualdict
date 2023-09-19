resource "google_firestore_document" "today" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "today"
  fields      = file("${path.module}/today.json")
}
