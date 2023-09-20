resource "google_firestore_document" "obliterate" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "obliterate"
  fields      = file("${path.module}/obliterate.json")
}
