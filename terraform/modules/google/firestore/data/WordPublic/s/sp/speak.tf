resource "google_firestore_document" "speak" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "speak"
  fields      = file("${path.module}/speak.json")
}
