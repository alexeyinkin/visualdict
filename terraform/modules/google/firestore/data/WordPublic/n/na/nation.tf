resource "google_firestore_document" "nation" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "nation"
  fields      = file("${path.module}/nation.json")
}
