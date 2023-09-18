resource "google_firestore_document" "week" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "week"
  fields      = file("${path.module}/week.json")
}
