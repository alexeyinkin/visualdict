resource "google_firestore_document" "abash" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "abash"
  fields      = file("${path.module}/abash.json")
}
