resource "google_firestore_document" "another" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "another"
  fields      = file("${path.module}/another.json")
}
