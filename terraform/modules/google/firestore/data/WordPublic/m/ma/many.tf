resource "google_firestore_document" "many" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "many"
  fields      = file("${path.module}/many.json")
}
