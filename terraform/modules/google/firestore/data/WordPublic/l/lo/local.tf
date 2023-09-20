resource "google_firestore_document" "local" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "local"
  fields      = file("${path.module}/local.json")
}
