resource "google_firestore_document" "for" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "for"
  fields      = file("${path.module}/for.json")
}
