resource "google_firestore_document" "story" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "story"
  fields      = file("${path.module}/story.json")
}
