resource "google_firestore_document" "bristle" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "bristle"
  fields      = file("${path.module}/bristle.json")
}
