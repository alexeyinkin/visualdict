resource "google_firestore_document" "layperson" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "layperson"
  fields      = file("${path.module}/layperson.json")
}
