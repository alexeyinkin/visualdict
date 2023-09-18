resource "google_firestore_document" "every" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "every"
  fields      = file("${path.module}/every.json")
}
