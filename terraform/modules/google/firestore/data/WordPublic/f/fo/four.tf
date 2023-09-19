resource "google_firestore_document" "four" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "four"
  fields      = file("${path.module}/four.json")
}
