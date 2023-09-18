resource "google_firestore_document" "very" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "very"
  fields      = file("${path.module}/very.json")
}
