resource "google_firestore_document" "demerit" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "demerit"
  fields      = file("${path.module}/demerit.json")
}
