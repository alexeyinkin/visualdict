resource "google_firestore_document" "such" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "such"
  fields      = file("${path.module}/such.json")
}
