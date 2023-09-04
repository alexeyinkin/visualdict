resource "google_firestore_document" "a" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "a"
  fields      = file("${path.module}/a.json")
}
