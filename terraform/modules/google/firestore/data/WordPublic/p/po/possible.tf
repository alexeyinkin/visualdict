resource "google_firestore_document" "possible" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "possible"
  fields      = file("${path.module}/possible.json")
}
