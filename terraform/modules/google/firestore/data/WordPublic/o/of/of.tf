resource "google_firestore_document" "of" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "of"
  fields      = file("${path.module}/of.json")
}
