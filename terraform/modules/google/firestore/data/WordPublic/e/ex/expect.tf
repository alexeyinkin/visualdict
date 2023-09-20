resource "google_firestore_document" "expect" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "expect"
  fields      = file("${path.module}/expect.json")
}
