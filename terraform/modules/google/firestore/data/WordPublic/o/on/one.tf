resource "google_firestore_document" "one" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "one"
  fields      = file("${path.module}/one.json")
}
