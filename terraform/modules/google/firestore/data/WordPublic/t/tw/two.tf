resource "google_firestore_document" "two" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "two"
  fields      = file("${path.module}/two.json")
}
