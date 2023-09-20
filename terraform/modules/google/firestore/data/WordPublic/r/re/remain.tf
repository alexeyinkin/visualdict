resource "google_firestore_document" "remain" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "remain"
  fields      = file("${path.module}/remain.json")
}
