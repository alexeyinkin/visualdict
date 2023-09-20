resource "google_firestore_document" "early" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "early"
  fields      = file("${path.module}/early.json")
}
