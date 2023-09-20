resource "google_firestore_document" "strong" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "strong"
  fields      = file("${path.module}/strong.json")
}
