resource "google_firestore_document" "where" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "where"
  fields      = file("${path.module}/where.json")
}
