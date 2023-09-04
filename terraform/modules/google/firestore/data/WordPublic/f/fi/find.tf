resource "google_firestore_document" "find" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "find"
  fields      = file("${path.module}/find.json")
}
