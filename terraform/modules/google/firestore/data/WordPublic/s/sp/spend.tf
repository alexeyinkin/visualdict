resource "google_firestore_document" "spend" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "spend"
  fields      = file("${path.module}/spend.json")
}
