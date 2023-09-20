resource "google_firestore_document" "wrong" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "wrong"
  fields      = file("${path.module}/wrong.json")
}
