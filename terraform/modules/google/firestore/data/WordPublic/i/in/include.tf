resource "google_firestore_document" "include" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "include"
  fields      = file("${path.module}/include.json")
}
