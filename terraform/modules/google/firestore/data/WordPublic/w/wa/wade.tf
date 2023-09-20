resource "google_firestore_document" "wade" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "wade"
  fields      = file("${path.module}/wade.json")
}
