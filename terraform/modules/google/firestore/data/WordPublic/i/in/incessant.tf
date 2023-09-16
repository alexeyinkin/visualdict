resource "google_firestore_document" "incessant" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "incessant"
  fields      = file("${path.module}/incessant.json")
}
