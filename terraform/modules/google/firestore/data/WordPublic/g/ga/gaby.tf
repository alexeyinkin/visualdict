resource "google_firestore_document" "gaby" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "gaby"
  fields      = file("${path.module}/gaby.json")
}
