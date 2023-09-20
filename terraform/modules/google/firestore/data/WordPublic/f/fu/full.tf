resource "google_firestore_document" "full" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "full"
  fields      = file("${path.module}/full.json")
}
