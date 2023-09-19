resource "google_firestore_document" "water" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "water"
  fields      = file("${path.module}/water.json")
}
