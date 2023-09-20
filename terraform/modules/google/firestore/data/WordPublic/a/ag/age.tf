resource "google_firestore_document" "age" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "age"
  fields      = file("${path.module}/age.json")
}
