resource "google_firestore_document" "to" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "to"
  fields      = file("${path.module}/to.json")
}
