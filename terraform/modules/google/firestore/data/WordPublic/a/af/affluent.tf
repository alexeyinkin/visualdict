resource "google_firestore_document" "affluent" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "affluent"
  fields      = file("${path.module}/affluent.json")
}
