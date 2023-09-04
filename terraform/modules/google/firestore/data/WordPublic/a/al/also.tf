resource "google_firestore_document" "also" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "also"
  fields      = file("${path.module}/also.json")
}
