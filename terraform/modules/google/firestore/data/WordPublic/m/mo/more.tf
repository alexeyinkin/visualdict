resource "google_firestore_document" "more" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "more"
  fields      = file("${path.module}/more.json")
}
