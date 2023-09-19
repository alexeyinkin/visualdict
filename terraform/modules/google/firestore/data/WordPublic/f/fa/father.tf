resource "google_firestore_document" "father" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "father"
  fields      = file("${path.module}/father.json")
}
