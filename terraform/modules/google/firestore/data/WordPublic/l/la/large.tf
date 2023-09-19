resource "google_firestore_document" "large" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "large"
  fields      = file("${path.module}/large.json")
}
