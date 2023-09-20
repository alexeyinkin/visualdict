resource "google_firestore_document" "heart" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "heart"
  fields      = file("${path.module}/heart.json")
}
