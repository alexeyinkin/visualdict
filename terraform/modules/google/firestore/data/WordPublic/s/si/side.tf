resource "google_firestore_document" "side" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "side"
  fields      = file("${path.module}/side.json")
}
