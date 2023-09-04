resource "google_firestore_document" "the" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "the"
  fields      = file("${path.module}/the.json")
}
