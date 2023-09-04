resource "google_firestore_document" "people" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "people"
  fields      = file("${path.module}/people.json")
}
