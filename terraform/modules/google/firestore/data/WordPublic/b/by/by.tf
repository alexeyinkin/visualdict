resource "google_firestore_document" "by" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "by"
  fields      = file("${path.module}/by.json")
}
