resource "google_firestore_document" "mean" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "mean"
  fields      = file("${path.module}/mean.json")
}
