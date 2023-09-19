resource "google_firestore_document" "guy" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "guy"
  fields      = file("${path.module}/guy.json")
}
