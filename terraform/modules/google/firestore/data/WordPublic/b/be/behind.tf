resource "google_firestore_document" "behind" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "behind"
  fields      = file("${path.module}/behind.json")
}
