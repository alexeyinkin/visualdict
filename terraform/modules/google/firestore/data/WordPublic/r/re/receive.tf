resource "google_firestore_document" "receive" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "receive"
  fields      = file("${path.module}/receive.json")
}
