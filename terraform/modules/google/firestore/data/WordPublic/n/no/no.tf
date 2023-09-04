resource "google_firestore_document" "no" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "no"
  fields      = file("${path.module}/no.json")
}
