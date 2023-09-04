resource "google_firestore_document" "that" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "that"
  fields      = file("${path.module}/that.json")
}
