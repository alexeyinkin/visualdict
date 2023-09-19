resource "google_firestore_document" "love" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "love"
  fields      = file("${path.module}/love.json")
}
