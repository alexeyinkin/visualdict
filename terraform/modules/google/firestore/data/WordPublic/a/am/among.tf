resource "google_firestore_document" "among" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "among"
  fields      = file("${path.module}/among.json")
}
