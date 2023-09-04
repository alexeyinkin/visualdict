resource "google_firestore_document" "not" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "not"
  fields      = file("${path.module}/not.json")
}
