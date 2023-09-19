resource "google_firestore_document" "sit" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "sit"
  fields      = file("${path.module}/sit.json")
}
