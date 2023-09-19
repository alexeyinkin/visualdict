resource "google_firestore_document" "white" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "white"
  fields      = file("${path.module}/white.json")
}
