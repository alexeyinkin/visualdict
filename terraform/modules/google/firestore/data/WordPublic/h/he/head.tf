resource "google_firestore_document" "head" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "head"
  fields      = file("${path.module}/head.json")
}
