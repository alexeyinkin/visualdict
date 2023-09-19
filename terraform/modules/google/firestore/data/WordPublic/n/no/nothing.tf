resource "google_firestore_document" "nothing" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "nothing"
  fields      = file("${path.module}/nothing.json")
}
