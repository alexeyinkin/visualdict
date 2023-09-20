resource "google_firestore_document" "table" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "table"
  fields      = file("${path.module}/table.json")
}
