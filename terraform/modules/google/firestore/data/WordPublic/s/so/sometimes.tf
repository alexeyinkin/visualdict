resource "google_firestore_document" "sometimes" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "sometimes"
  fields      = file("${path.module}/sometimes.json")
}
