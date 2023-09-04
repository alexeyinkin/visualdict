resource "google_firestore_document" "will" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "will"
  fields      = file("${path.module}/will.json")
}
