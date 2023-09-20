resource "google_firestore_document" "skedaddle" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "skedaddle"
  fields      = file("${path.module}/skedaddle.json")
}
