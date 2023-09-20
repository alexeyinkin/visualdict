resource "google_firestore_document" "hard" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "hard"
  fields      = file("${path.module}/hard.json")
}
