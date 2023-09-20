resource "google_firestore_document" "report" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "report"
  fields      = file("${path.module}/report.json")
}
