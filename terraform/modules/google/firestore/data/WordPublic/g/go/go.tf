resource "google_firestore_document" "go" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "go"
  fields      = file("${path.module}/go.json")
}
