resource "google_firestore_document" "although" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "although"
  fields      = file("${path.module}/although.json")
}
