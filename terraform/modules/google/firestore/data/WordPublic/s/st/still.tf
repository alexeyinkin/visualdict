resource "google_firestore_document" "still" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "still"
  fields      = file("${path.module}/still.json")
}
