resource "google_firestore_document" "certitude" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "certitude"
  fields      = file("${path.module}/certitude.json")
}
