resource "google_firestore_document" "number" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "number"
  fields      = file("${path.module}/number.json")
}
