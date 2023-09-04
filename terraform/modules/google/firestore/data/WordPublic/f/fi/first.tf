resource "google_firestore_document" "first" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "first"
  fields      = file("${path.module}/first.json")
}
