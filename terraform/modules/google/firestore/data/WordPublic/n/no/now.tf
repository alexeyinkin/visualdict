resource "google_firestore_document" "now" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "now"
  fields      = file("${path.module}/now.json")
}
