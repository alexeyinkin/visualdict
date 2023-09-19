resource "google_firestore_document" "both" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "both"
  fields      = file("${path.module}/both.json")
}
