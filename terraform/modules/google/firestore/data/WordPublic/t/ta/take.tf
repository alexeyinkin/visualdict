resource "google_firestore_document" "take" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "take"
  fields      = file("${path.module}/take.json")
}
