resource "google_firestore_document" "disavow" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "disavow"
  fields      = file("${path.module}/disavow.json")
}
