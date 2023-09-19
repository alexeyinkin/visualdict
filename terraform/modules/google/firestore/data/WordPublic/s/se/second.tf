resource "google_firestore_document" "second" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "second"
  fields      = file("${path.module}/second.json")
}
