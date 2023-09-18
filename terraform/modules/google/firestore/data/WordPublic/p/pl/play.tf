resource "google_firestore_document" "play" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "play"
  fields      = file("${path.module}/play.json")
}
