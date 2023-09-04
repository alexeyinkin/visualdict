resource "google_firestore_document" "good" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "good"
  fields      = file("${path.module}/good.json")
}
