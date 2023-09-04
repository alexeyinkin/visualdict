resource "google_firestore_document" "her" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "her"
  fields      = file("${path.module}/her.json")
}
