resource "google_firestore_document" "doldrums" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "doldrums"
  fields      = file("${path.module}/doldrums.json")
}
