resource "google_firestore_document" "long" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "long"
  fields      = file("${path.module}/long.json")
}
