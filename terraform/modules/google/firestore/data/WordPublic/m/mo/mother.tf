resource "google_firestore_document" "mother" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "mother"
  fields      = file("${path.module}/mother.json")
}
