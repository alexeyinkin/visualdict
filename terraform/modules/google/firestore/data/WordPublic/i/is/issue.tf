resource "google_firestore_document" "issue" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "issue"
  fields      = file("${path.module}/issue.json")
}
