resource "google_firestore_document" "explain" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "explain"
  fields      = file("${path.module}/explain.json")
}
