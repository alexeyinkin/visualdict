resource "google_firestore_document" "believe" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "believe"
  fields      = file("${path.module}/believe.json")
}
