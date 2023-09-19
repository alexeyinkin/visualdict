resource "google_firestore_document" "hey" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "hey"
  fields      = file("${path.module}/hey.json")
}
