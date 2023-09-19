resource "google_firestore_document" "least" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "least"
  fields      = file("${path.module}/least.json")
}
