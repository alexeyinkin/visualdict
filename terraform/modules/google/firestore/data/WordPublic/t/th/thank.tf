resource "google_firestore_document" "thank" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "thank"
  fields      = file("${path.module}/thank.json")
}
