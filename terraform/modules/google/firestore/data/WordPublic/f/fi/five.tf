resource "google_firestore_document" "five" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "five"
  fields      = file("${path.module}/five.json")
}
