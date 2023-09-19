resource "google_firestore_document" "american" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "american"
  fields      = file("${path.module}/american.json")
}
