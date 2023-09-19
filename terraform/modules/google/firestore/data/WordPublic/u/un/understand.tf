resource "google_firestore_document" "understand" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "understand"
  fields      = file("${path.module}/understand.json")
}
