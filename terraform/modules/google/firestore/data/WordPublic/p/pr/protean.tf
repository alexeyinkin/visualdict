resource "google_firestore_document" "protean" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "protean"
  fields      = file("${path.module}/protean.json")
}
