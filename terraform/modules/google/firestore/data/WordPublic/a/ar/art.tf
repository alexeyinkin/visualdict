resource "google_firestore_document" "art" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "art"
  fields      = file("${path.module}/art.json")
}
