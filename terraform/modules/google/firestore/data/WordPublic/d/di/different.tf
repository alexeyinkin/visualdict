resource "google_firestore_document" "different" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "different"
  fields      = file("${path.module}/different.json")
}
