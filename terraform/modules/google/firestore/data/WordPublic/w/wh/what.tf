resource "google_firestore_document" "what" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "what"
  fields      = file("${path.module}/what.json")
}
