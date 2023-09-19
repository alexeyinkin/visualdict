resource "google_firestore_document" "little" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "little"
  fields      = file("${path.module}/little.json")
}
