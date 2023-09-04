resource "google_firestore_document" "because" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "because"
  fields      = file("${path.module}/because.json")
}
