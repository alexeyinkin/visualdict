resource "google_firestore_document" "way" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "way"
  fields      = file("${path.module}/way.json")
}
