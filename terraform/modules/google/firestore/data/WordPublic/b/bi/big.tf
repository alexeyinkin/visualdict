resource "google_firestore_document" "big" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "big"
  fields      = file("${path.module}/big.json")
}
