resource "google_firestore_document" "these" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "these"
  fields      = file("${path.module}/these.json")
}
