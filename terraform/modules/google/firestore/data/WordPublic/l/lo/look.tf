resource "google_firestore_document" "look" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "look"
  fields      = file("${path.module}/look.json")
}
