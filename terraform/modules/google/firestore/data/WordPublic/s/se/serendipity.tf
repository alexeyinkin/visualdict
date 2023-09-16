resource "google_firestore_document" "serendipity" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "serendipity"
  fields      = file("${path.module}/serendipity.json")
}
