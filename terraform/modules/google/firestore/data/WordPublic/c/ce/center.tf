resource "google_firestore_document" "center" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "center"
  fields      = file("${path.module}/center.json")
}
