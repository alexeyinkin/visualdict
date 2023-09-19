resource "google_firestore_document" "almost" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "almost"
  fields      = file("${path.module}/almost.json")
}
