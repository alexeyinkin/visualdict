resource "google_firestore_document" "market" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "market"
  fields      = file("${path.module}/market.json")
}
