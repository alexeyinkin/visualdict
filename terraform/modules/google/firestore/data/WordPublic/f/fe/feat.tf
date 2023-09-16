resource "google_firestore_document" "feat" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "feat"
  fields      = file("${path.module}/feat.json")
}
