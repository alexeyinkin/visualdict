resource "google_firestore_document" "become" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "become"
  fields      = file("${path.module}/become.json")
}
