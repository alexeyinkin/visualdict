resource "google_firestore_document" "important" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "important"
  fields      = file("${path.module}/important.json")
}
