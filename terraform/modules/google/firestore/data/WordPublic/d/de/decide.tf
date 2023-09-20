resource "google_firestore_document" "decide" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "decide"
  fields      = file("${path.module}/decide.json")
}
