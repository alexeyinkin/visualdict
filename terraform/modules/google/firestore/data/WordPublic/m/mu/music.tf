resource "google_firestore_document" "music" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "music"
  fields      = file("${path.module}/music.json")
}
