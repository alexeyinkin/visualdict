resource "google_firestore_document" "himself" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "himself"
  fields      = file("${path.module}/himself.json")
}
