resource "google_firestore_document" "away" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "away"
  fields      = file("${path.module}/away.json")
}
