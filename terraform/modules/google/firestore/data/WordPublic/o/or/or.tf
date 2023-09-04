resource "google_firestore_document" "or" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "or"
  fields      = file("${path.module}/or.json")
}
