resource "google_firestore_document" "off" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "off"
  fields      = file("${path.module}/off.json")
}
