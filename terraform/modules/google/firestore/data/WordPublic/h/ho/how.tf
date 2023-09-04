resource "google_firestore_document" "how" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "how"
  fields      = file("${path.module}/how.json")
}
