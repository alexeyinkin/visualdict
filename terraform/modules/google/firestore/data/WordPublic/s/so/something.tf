resource "google_firestore_document" "something" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "something"
  fields      = file("${path.module}/something.json")
}
