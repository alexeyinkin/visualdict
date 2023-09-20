resource "google_firestore_document" "across" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "across"
  fields      = file("${path.module}/across.json")
}
