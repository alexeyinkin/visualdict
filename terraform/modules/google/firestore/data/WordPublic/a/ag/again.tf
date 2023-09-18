resource "google_firestore_document" "again" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "again"
  fields      = file("${path.module}/again.json")
}
