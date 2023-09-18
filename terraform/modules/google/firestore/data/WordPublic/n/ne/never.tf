resource "google_firestore_document" "never" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "never"
  fields      = file("${path.module}/never.json")
}
