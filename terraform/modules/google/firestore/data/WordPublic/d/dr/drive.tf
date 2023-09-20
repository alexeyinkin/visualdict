resource "google_firestore_document" "drive" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "drive"
  fields      = file("${path.module}/drive.json")
}
