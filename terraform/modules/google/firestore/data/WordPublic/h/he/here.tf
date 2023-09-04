resource "google_firestore_document" "here" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "here"
  fields      = file("${path.module}/here.json")
}
