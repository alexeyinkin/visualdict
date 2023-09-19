resource "google_firestore_document" "fact" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "fact"
  fields      = file("${path.module}/fact.json")
}
