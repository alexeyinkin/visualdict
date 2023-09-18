resource "google_firestore_document" "seem" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "seem"
  fields      = file("${path.module}/seem.json")
}
