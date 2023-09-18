resource "google_firestore_document" "old" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "old"
  fields      = file("${path.module}/old.json")
}
