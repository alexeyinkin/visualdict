resource "google_firestore_document" "year" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "year"
  fields      = file("${path.module}/year.json")
}
