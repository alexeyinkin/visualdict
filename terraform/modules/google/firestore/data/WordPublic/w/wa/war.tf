resource "google_firestore_document" "war" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "war"
  fields      = file("${path.module}/war.json")
}
