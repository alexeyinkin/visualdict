resource "google_firestore_document" "oh" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "oh"
  fields      = file("${path.module}/oh.json")
}
