resource "google_firestore_document" "young" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "young"
  fields      = file("${path.module}/young.json")
}
