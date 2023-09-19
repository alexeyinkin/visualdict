resource "google_firestore_document" "whether" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "whether"
  fields      = file("${path.module}/whether.json")
}
