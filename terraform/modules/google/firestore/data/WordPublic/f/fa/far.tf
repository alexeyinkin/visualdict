resource "google_firestore_document" "far" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "far"
  fields      = file("${path.module}/far.json")
}
