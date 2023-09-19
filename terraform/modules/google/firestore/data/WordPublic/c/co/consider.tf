resource "google_firestore_document" "consider" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "consider"
  fields      = file("${path.module}/consider.json")
}
