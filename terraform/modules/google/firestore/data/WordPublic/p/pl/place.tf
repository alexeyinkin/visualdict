resource "google_firestore_document" "place" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "place"
  fields      = file("${path.module}/place.json")
}
