resource "google_firestore_document" "until" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "until"
  fields      = file("${path.module}/until.json")
}
