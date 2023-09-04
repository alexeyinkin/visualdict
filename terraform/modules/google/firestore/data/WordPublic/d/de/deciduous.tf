resource "google_firestore_document" "deciduous" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "deciduous"
  fields      = file("${path.module}/deciduous.json")
}
