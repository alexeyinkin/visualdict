resource "google_firestore_document" "control" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "control"
  fields      = file("${path.module}/control.json")
}
