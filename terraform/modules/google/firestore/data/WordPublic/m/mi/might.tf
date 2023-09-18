resource "google_firestore_document" "might" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "might"
  fields      = file("${path.module}/might.json")
}
