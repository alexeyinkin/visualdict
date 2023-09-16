resource "google_firestore_document" "elude" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "elude"
  fields      = file("${path.module}/elude.json")
}
