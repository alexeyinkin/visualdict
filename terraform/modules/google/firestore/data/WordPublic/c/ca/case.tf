resource "google_firestore_document" "case" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "case"
  fields      = file("${path.module}/case.json")
}
