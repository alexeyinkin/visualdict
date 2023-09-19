resource "google_firestore_document" "night" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "night"
  fields      = file("${path.module}/night.json")
}
