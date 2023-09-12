resource "google_firestore_document" "predilection" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "predilection"
  fields      = file("${path.module}/predilection.json")
}
