resource "google_firestore_document" "under" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "under"
  fields      = file("${path.module}/under.json")
}
