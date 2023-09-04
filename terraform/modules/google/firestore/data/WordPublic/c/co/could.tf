resource "google_firestore_document" "could" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "could"
  fields      = file("${path.module}/could.json")
}
