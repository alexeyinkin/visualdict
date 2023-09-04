resource "google_firestore_document" "our" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "our"
  fields      = file("${path.module}/our.json")
}
