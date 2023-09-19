resource "google_firestore_document" "social" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "social"
  fields      = file("${path.module}/social.json")
}
