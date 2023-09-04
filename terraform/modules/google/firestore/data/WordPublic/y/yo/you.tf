resource "google_firestore_document" "you" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "you"
  fields      = file("${path.module}/you.json")
}
