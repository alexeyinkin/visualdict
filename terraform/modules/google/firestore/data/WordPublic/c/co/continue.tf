resource "google_firestore_document" "continue" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "continue"
  fields      = file("${path.module}/continue.json")
}
