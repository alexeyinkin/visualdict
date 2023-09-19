resource "google_firestore_document" "add" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "add"
  fields      = file("${path.module}/add.json")
}
