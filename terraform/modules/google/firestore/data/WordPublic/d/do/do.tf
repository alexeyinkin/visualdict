resource "google_firestore_document" "do" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "do"
  fields      = file("${path.module}/do.json")
}
