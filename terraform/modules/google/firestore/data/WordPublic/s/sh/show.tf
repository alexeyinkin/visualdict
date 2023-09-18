resource "google_firestore_document" "show" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "show"
  fields      = file("${path.module}/show.json")
}
