resource "google_firestore_document" "filch" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "filch"
  fields      = file("${path.module}/filch.json")
}
