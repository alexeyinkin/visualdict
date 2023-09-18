resource "google_firestore_document" "life" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "life"
  fields      = file("${path.module}/life.json")
}
