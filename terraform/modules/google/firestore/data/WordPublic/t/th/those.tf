resource "google_firestore_document" "those" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "those"
  fields      = file("${path.module}/those.json")
}
