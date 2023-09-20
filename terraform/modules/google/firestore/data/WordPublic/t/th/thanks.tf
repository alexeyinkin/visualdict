resource "google_firestore_document" "thanks" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "thanks"
  fields      = file("${path.module}/thanks.json")
}
