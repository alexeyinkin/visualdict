resource "google_firestore_document" "wait" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "wait"
  fields      = file("${path.module}/wait.json")
}
