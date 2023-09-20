resource "google_firestore_document" "daft" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "daft"
  fields      = file("${path.module}/daft.json")
}
