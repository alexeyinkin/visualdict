resource "google_firestore_document" "city" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "city"
  fields      = file("${path.module}/city.json")
}
