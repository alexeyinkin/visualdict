resource "google_firestore_document" "dote" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "dote"
  fields      = file("${path.module}/dote.json")
}
