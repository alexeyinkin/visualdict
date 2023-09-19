resource "google_firestore_document" "news" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "news"
  fields      = file("${path.module}/news.json")
}
