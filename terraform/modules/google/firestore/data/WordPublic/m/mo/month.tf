resource "google_firestore_document" "month" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "month"
  fields      = file("${path.module}/month.json")
}
