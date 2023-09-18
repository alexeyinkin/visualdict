resource "google_firestore_document" "keep" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "keep"
  fields      = file("${path.module}/keep.json")
}
