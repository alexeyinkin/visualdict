resource "google_firestore_document" "parent" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "parent"
  fields      = file("${path.module}/parent.json")
}
