resource "google_firestore_document" "family" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "family"
  fields      = file("${path.module}/family.json")
}
