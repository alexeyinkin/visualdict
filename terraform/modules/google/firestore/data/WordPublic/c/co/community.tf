resource "google_firestore_document" "community" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "community"
  fields      = file("${path.module}/community.json")
}
