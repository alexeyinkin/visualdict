resource "google_firestore_document" "up" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "up"
  fields      = file("${path.module}/up.json")
}
