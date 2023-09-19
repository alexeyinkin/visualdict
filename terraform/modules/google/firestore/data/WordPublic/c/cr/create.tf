resource "google_firestore_document" "create" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "create"
  fields      = file("${path.module}/create.json")
}
