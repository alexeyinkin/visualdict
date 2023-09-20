resource "google_firestore_document" "easy" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "easy"
  fields      = file("${path.module}/easy.json")
}
