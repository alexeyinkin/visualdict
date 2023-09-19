resource "google_firestore_document" "else" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "else"
  fields      = file("${path.module}/else.json")
}
