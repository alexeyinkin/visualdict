resource "google_firestore_document" "body" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "body"
  fields      = file("${path.module}/body.json")
}
