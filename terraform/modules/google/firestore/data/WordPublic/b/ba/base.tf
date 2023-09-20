resource "google_firestore_document" "base" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "base"
  fields      = file("${path.module}/base.json")
}
