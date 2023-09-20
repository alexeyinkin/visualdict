resource "google_firestore_document" "sorry" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "sorry"
  fields      = file("${path.module}/sorry.json")
}
