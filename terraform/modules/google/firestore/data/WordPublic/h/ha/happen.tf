resource "google_firestore_document" "happen" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "happen"
  fields      = file("${path.module}/happen.json")
}
