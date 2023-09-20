resource "google_firestore_document" "hope" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "hope"
  fields      = file("${path.module}/hope.json")
}
