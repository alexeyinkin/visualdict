resource "google_firestore_document" "set" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "set"
  fields      = file("${path.module}/set.json")
}
