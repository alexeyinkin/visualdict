resource "google_firestore_document" "say" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "say"
  fields      = file("${path.module}/say.json")
}
