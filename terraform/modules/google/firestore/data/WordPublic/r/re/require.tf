resource "google_firestore_document" "require" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "require"
  fields      = file("${path.module}/require.json")
}
