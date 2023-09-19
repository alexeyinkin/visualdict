resource "google_firestore_document" "hold" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "hold"
  fields      = file("${path.module}/hold.json")
}
