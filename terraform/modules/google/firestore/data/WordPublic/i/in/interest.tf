resource "google_firestore_document" "interest" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "interest"
  fields      = file("${path.module}/interest.json")
}
