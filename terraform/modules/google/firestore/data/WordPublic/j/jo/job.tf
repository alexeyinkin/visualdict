resource "google_firestore_document" "job" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "job"
  fields      = file("${path.module}/job.json")
}
