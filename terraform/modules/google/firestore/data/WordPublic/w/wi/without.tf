resource "google_firestore_document" "without" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "without"
  fields      = file("${path.module}/without.json")
}
