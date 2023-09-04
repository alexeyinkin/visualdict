resource "google_firestore_document" "this" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "this"
  fields      = file("${path.module}/this.json")
}
