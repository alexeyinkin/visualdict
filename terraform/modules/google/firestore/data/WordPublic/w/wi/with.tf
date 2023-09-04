resource "google_firestore_document" "with" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "with"
  fields      = file("${path.module}/with.json")
}
