resource "google_firestore_document" "process" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "process"
  fields      = file("${path.module}/process.json")
}
