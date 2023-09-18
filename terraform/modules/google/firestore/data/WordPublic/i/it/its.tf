resource "google_firestore_document" "its" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "its"
  fields      = file("${path.module}/its.json")
}
