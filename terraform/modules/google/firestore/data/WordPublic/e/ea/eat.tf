resource "google_firestore_document" "eat" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "eat"
  fields      = file("${path.module}/eat.json")
}
