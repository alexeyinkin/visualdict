resource "google_firestore_document" "meet" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "meet"
  fields      = file("${path.module}/meet.json")
}
