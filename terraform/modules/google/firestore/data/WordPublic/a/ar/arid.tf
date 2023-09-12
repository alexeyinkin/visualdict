resource "google_firestore_document" "arid" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "arid"
  fields      = file("${path.module}/arid.json")
}
