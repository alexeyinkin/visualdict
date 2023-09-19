resource "google_firestore_document" "end" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "end"
  fields      = file("${path.module}/end.json")
}
