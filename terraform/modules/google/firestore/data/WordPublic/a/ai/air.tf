resource "google_firestore_document" "air" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "air"
  fields      = file("${path.module}/air.json")
}
