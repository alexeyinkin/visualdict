resource "google_firestore_document" "lush" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "lush"
  fields      = file("${path.module}/lush.json")
}
