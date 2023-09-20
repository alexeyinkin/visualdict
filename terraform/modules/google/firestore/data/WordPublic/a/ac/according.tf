resource "google_firestore_document" "according" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "according"
  fields      = file("${path.module}/according.json")
}
