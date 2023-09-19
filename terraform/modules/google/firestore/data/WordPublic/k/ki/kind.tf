resource "google_firestore_document" "kind" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "kind"
  fields      = file("${path.module}/kind.json")
}
