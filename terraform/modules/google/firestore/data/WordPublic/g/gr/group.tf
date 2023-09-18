resource "google_firestore_document" "group" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "group"
  fields      = file("${path.module}/group.json")
}
