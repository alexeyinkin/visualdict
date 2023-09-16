resource "google_firestore_document" "quotidian" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "quotidian"
  fields      = file("${path.module}/quotidian.json")
}
