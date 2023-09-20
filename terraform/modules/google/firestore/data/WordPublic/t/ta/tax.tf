resource "google_firestore_document" "tax" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "tax"
  fields      = file("${path.module}/tax.json")
}
