resource "google_firestore_document" "run" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "run"
  fields      = file("${path.module}/run.json")
}
