resource "google_firestore_document" "always" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "always"
  fields      = file("${path.module}/always.json")
}
