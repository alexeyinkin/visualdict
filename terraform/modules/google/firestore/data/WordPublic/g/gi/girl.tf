resource "google_firestore_document" "girl" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "girl"
  fields      = file("${path.module}/girl.json")
}
