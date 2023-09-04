resource "google_firestore_document" "on" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "on"
  fields      = file("${path.module}/on.json")
}
