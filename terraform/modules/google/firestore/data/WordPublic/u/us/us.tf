resource "google_firestore_document" "us" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "us"
  fields      = file("${path.module}/us.json")
}
