resource "google_firestore_document" "security" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "security"
  fields      = file("${path.module}/security.json")
}
