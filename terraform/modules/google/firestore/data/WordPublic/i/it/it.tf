resource "google_firestore_document" "it" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "it"
  fields      = file("${path.module}/it.json")
}
