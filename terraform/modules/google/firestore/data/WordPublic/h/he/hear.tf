resource "google_firestore_document" "hear" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "hear"
  fields      = file("${path.module}/hear.json")
}
