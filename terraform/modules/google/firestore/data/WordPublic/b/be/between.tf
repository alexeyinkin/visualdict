resource "google_firestore_document" "between" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "between"
  fields      = file("${path.module}/between.json")
}
