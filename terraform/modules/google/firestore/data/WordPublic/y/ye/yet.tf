resource "google_firestore_document" "yet" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "yet"
  fields      = file("${path.module}/yet.json")
}
