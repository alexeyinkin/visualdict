resource "google_firestore_document" "superficial" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "superficial"
  fields      = file("${path.module}/superficial.json")
}
