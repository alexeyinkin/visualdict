resource "google_firestore_document" "republican" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "republican"
  fields      = file("${path.module}/republican.json")
}
