resource "google_firestore_document" "write" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "write"
  fields      = file("${path.module}/write.json")
}
