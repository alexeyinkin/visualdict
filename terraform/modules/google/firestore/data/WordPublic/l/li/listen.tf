resource "google_firestore_document" "listen" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "listen"
  fields      = file("${path.module}/listen.json")
}
