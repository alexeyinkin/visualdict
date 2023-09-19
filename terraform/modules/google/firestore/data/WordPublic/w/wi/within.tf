resource "google_firestore_document" "within" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "within"
  fields      = file("${path.module}/within.json")
}
