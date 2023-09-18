resource "google_firestore_document" "only" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "only"
  fields      = file("${path.module}/only.json")
}
