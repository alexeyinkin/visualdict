resource "google_firestore_document" "decision" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "decision"
  fields      = file("${path.module}/decision.json")
}
