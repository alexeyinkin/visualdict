resource "google_firestore_document" "reason" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "reason"
  fields      = file("${path.module}/reason.json")
}
