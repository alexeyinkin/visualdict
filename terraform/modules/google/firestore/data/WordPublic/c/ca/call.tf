resource "google_firestore_document" "call" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "call"
  fields      = file("${path.module}/call.json")
}
