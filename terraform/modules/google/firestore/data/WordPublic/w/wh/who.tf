resource "google_firestore_document" "who" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "who"
  fields      = file("${path.module}/who.json")
}
