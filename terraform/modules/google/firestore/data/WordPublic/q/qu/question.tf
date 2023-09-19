resource "google_firestore_document" "question" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "question"
  fields      = file("${path.module}/question.json")
}
