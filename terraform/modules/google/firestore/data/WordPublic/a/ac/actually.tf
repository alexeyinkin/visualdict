resource "google_firestore_document" "actually" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "actually"
  fields      = file("${path.module}/actually.json")
}
