resource "google_firestore_document" "when" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "when"
  fields      = file("${path.module}/when.json")
}
