resource "google_firestore_document" "ago" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "ago"
  fields      = file("${path.module}/ago.json")
}
