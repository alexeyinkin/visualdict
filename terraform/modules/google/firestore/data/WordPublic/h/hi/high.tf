resource "google_firestore_document" "high" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "high"
  fields      = file("${path.module}/high.json")
}
