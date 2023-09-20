resource "google_firestore_document" "reach" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "reach"
  fields      = file("${path.module}/reach.json")
}
