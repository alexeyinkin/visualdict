resource "google_firestore_document" "derelict" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "derelict"
  fields      = file("${path.module}/derelict.json")
}
