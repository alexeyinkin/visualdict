resource "google_firestore_document" "everyone" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "everyone"
  fields      = file("${path.module}/everyone.json")
}
