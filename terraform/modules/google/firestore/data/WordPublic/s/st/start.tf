resource "google_firestore_document" "start" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "start"
  fields      = file("${path.module}/start.json")
}
