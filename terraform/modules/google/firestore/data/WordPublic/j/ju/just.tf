resource "google_firestore_document" "just" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "just"
  fields      = file("${path.module}/just.json")
}
