resource "google_firestore_document" "ancillary" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "ancillary"
  fields      = file("${path.module}/ancillary.json")
}
