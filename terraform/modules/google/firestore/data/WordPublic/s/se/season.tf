resource "google_firestore_document" "season" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "season"
  fields      = file("${path.module}/season.json")
}
