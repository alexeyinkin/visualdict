resource "google_firestore_document" "would" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "would"
  fields      = file("${path.module}/would.json")
}
