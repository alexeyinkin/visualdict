resource "google_firestore_document" "why" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "why"
  fields      = file("${path.module}/why.json")
}
