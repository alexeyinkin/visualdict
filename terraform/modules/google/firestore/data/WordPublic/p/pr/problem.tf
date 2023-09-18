resource "google_firestore_document" "problem" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "problem"
  fields      = file("${path.module}/problem.json")
}
