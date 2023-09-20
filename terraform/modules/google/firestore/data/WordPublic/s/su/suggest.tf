resource "google_firestore_document" "suggest" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "suggest"
  fields      = file("${path.module}/suggest.json")
}
