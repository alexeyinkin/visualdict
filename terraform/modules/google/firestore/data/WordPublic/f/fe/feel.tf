resource "google_firestore_document" "feel" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "feel"
  fields      = file("${path.module}/feel.json")
}
