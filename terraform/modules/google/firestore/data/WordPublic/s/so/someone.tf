resource "google_firestore_document" "someone" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "someone"
  fields      = file("${path.module}/someone.json")
}
