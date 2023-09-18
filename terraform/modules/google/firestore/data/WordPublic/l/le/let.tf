resource "google_firestore_document" "let" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "let"
  fields      = file("${path.module}/let.json")
}
