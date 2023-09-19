resource "google_firestore_document" "stay" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "stay"
  fields      = file("${path.module}/stay.json")
}
