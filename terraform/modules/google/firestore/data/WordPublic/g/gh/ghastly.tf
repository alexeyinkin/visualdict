resource "google_firestore_document" "ghastly" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "ghastly"
  fields      = file("${path.module}/ghastly.json")
}
