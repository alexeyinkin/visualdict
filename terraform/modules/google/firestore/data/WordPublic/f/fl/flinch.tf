resource "google_firestore_document" "flinch" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "flinch"
  fields      = file("${path.module}/flinch.json")
}
