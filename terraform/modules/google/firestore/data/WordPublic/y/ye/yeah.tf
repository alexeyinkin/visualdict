resource "google_firestore_document" "yeah" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "yeah"
  fields      = file("${path.module}/yeah.json")
}
