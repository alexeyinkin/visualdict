resource "google_firestore_document" "study" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "study"
  fields      = file("${path.module}/study.json")
}
