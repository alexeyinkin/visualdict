resource "google_firestore_document" "much" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "much"
  fields      = file("${path.module}/much.json")
}
