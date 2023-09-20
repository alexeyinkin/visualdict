resource "google_firestore_document" "agree" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "agree"
  fields      = file("${path.module}/agree.json")
}
