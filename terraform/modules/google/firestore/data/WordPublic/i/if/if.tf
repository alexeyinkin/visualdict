resource "google_firestore_document" "if" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "if"
  fields      = file("${path.module}/if.json")
}
