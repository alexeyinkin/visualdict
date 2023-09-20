resource "google_firestore_document" "effect" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "effect"
  fields      = file("${path.module}/effect.json")
}
