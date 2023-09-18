resource "google_firestore_document" "most" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "most"
  fields      = file("${path.module}/most.json")
}
