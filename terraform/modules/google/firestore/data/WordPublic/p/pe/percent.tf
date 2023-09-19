resource "google_firestore_document" "percent" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "percent"
  fields      = file("${path.module}/percent.json")
}
