resource "google_firestore_document" "while" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "while"
  fields      = file("${path.module}/while.json")
}
