resource "google_firestore_document" "copacetic" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "copacetic"
  fields      = file("${path.module}/copacetic.json")
}
