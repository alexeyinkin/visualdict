resource "google_firestore_document" "able" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "able"
  fields      = file("${path.module}/able.json")
}
