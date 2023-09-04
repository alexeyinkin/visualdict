resource "google_firestore_document" "give" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "give"
  fields      = file("${path.module}/give.json")
}
