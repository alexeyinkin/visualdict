resource "google_firestore_document" "court" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "court"
  fields      = file("${path.module}/court.json")
}
