resource "google_firestore_document" "down" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "down"
  fields      = file("${path.module}/down.json")
}
