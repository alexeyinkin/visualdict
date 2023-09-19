resource "google_firestore_document" "government" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "government"
  fields      = file("${path.module}/government.json")
}
