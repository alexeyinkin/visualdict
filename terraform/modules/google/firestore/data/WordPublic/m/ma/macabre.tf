resource "google_firestore_document" "macabre" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "macabre"
  fields      = file("${path.module}/macabre.json")
}
