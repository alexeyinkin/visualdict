resource "google_firestore_document" "support" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "support"
  fields      = file("${path.module}/support.json")
}
