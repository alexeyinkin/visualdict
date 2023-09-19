resource "google_firestore_document" "before" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "before"
  fields      = file("${path.module}/before.json")
}
