resource "google_firestore_document" "proliferate" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "proliferate"
  fields      = file("${path.module}/proliferate.json")
}
