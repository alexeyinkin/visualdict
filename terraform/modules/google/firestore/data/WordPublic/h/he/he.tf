resource "google_firestore_document" "he" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "he"
  fields      = file("${path.module}/he.json")
}
