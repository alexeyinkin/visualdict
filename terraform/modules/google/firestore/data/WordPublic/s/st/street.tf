resource "google_firestore_document" "street" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "street"
  fields      = file("${path.module}/street.json")
}
