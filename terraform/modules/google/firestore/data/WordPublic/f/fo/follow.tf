resource "google_firestore_document" "follow" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "follow"
  fields      = file("${path.module}/follow.json")
}
