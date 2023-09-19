resource "google_firestore_document" "though" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "though"
  fields      = file("${path.module}/though.json")
}
