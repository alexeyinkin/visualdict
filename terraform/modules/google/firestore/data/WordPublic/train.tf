resource "google_firestore_document" "train" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "train"
  fields      = file("${path.module}/train.json")
}
