resource "google_firestore_document" "bad" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "bad"
  fields      = file("${path.module}/bad.json")
}
