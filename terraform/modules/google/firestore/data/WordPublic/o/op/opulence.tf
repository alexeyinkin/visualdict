resource "google_firestore_document" "opulence" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "opulence"
  fields      = file("${path.module}/opulence.json")
}
