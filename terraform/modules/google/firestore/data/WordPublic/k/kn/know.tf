resource "google_firestore_document" "know" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "know"
  fields      = file("${path.module}/know.json")
}
