resource "google_firestore_document" "company" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "company"
  fields      = file("${path.module}/company.json")
}
