resource "google_firestore_document" "lavish" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "lavish"
  fields      = file("${path.module}/lavish.json")
}
