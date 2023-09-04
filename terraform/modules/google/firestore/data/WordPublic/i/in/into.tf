resource "google_firestore_document" "into" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "into"
  fields      = file("${path.module}/into.json")
}
