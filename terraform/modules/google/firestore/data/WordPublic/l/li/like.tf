resource "google_firestore_document" "like" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "like"
  fields      = file("${path.module}/like.json")
}
