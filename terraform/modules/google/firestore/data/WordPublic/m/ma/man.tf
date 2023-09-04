resource "google_firestore_document" "man" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "man"
  fields      = file("${path.module}/man.json")
}
