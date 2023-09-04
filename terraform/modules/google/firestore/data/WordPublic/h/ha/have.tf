resource "google_firestore_document" "have" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "have"
  fields      = file("${path.module}/have.json")
}
