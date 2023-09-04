resource "google_firestore_document" "in" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "in"
  fields      = file("${path.module}/in.json")
}
