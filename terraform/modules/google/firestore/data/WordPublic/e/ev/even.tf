resource "google_firestore_document" "even" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "even"
  fields      = file("${path.module}/even.json")
}
