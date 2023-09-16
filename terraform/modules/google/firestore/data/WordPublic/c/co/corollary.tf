resource "google_firestore_document" "corollary" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "corollary"
  fields      = file("${path.module}/corollary.json")
}
