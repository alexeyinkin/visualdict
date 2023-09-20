resource "google_firestore_document" "sense" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "sense"
  fields      = file("${path.module}/sense.json")
}
