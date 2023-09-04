resource "google_firestore_document" "him" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "him"
  fields      = file("${path.module}/him.json")
}
