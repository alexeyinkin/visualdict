resource "google_firestore_document" "boy" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "boy"
  fields      = file("${path.module}/boy.json")
}
