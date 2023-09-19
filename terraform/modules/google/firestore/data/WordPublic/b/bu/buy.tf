resource "google_firestore_document" "buy" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "buy"
  fields      = file("${path.module}/buy.json")
}
