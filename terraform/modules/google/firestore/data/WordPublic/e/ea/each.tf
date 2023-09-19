resource "google_firestore_document" "each" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "each"
  fields      = file("${path.module}/each.json")
}
