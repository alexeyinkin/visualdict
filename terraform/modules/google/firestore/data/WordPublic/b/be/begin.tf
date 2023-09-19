resource "google_firestore_document" "begin" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "begin"
  fields      = file("${path.module}/begin.json")
}
