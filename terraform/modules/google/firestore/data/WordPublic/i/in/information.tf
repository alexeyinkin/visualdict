resource "google_firestore_document" "information" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "information"
  fields      = file("${path.module}/information.json")
}
