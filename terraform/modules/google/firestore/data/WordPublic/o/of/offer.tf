resource "google_firestore_document" "offer" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "offer"
  fields      = file("${path.module}/offer.json")
}
