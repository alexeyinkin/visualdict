resource "google_firestore_document" "point" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "point"
  fields      = file("${path.module}/point.json")
}
