resource "google_firestore_document" "be" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "be"
  fields      = file("${path.module}/be.json")
}
