resource "google_firestore_document" "veritable" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "veritable"
  fields      = file("${path.module}/veritable.json")
}
