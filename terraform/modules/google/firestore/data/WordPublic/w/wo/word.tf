resource "google_firestore_document" "word" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "word"
  fields      = file("${path.module}/word.json")
}
