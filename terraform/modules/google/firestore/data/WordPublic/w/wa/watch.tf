resource "google_firestore_document" "watch" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "watch"
  fields      = file("${path.module}/watch.json")
}
