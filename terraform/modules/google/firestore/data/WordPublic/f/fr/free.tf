resource "google_firestore_document" "free" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "free"
  fields      = file("${path.module}/free.json")
}
