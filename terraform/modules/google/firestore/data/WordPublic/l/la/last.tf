resource "google_firestore_document" "last" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "last"
  fields      = file("${path.module}/last.json")
}
