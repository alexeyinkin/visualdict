resource "google_firestore_document" "book" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "book"
  fields      = file("${path.module}/book.json")
}
