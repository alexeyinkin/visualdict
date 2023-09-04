resource "google_firestore_document" "i" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "i"
  fields      = file("${path.module}/i.json")
}
