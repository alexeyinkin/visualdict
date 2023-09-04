resource "google_firestore_document" "so" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "so"
  fields      = file("${path.module}/so.json")
}
