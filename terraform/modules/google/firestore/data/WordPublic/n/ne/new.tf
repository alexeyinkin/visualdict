resource "google_firestore_document" "new" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "new"
  fields      = file("${path.module}/new.json")
}
