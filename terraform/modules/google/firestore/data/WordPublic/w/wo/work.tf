resource "google_firestore_document" "work" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "work"
  fields      = file("${path.module}/work.json")
}
