resource "google_firestore_document" "business" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "business"
  fields      = file("${path.module}/business.json")
}
