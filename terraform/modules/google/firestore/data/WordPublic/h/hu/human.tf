resource "google_firestore_document" "human" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "human"
  fields      = file("${path.module}/human.json")
}
