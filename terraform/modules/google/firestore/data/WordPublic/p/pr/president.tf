resource "google_firestore_document" "president" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "president"
  fields      = file("${path.module}/president.json")
}
