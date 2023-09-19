resource "google_firestore_document" "enough" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "enough"
  fields      = file("${path.module}/enough.json")
}
