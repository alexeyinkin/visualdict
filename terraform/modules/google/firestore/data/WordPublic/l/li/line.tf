resource "google_firestore_document" "line" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "line"
  fields      = file("${path.module}/line.json")
}
