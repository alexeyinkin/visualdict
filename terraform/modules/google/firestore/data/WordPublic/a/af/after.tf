resource "google_firestore_document" "after" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "after"
  fields      = file("${path.module}/after.json")
}
