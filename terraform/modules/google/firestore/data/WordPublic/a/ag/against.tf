resource "google_firestore_document" "against" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "against"
  fields      = file("${path.module}/against.json")
}
