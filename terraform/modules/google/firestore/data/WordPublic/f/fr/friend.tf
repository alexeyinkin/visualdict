resource "google_firestore_document" "friend" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "friend"
  fields      = file("${path.module}/friend.json")
}
