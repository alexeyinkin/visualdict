resource "google_firestore_document" "real" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "real"
  fields      = file("${path.module}/real.json")
}
