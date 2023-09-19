resource "google_firestore_document" "law" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "law"
  fields      = file("${path.module}/law.json")
}
