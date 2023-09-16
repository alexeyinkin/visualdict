resource "google_firestore_document" "steadfast" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "steadfast"
  fields      = file("${path.module}/steadfast.json")
}
