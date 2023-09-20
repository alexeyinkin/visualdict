resource "google_firestore_document" "care" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "care"
  fields      = file("${path.module}/care.json")
}
