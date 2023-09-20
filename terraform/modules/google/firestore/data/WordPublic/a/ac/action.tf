resource "google_firestore_document" "action" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "action"
  fields      = file("${path.module}/action.json")
}
