resource "google_firestore_document" "assiduous" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "assiduous"
  fields      = file("${path.module}/assiduous.json")
}
