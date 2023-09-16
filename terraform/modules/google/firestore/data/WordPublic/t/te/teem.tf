resource "google_firestore_document" "teem" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "teem"
  fields      = file("${path.module}/teem.json")
}
