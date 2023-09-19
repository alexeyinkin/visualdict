resource "google_firestore_document" "moment" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "moment"
  fields      = file("${path.module}/moment.json")
}
