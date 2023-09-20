resource "google_firestore_document" "anyone" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "anyone"
  fields      = file("${path.module}/anyone.json")
}
