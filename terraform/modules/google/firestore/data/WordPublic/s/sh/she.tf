resource "google_firestore_document" "she" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "she"
  fields      = file("${path.module}/she.json")
}
