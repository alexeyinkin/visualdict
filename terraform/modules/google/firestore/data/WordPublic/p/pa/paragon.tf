resource "google_firestore_document" "paragon" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "paragon"
  fields      = file("${path.module}/paragon.json")
}
