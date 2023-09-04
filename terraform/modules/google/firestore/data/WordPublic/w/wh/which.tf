resource "google_firestore_document" "which" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "which"
  fields      = file("${path.module}/which.json")
}
