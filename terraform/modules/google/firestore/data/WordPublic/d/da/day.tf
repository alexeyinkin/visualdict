resource "google_firestore_document" "day" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "day"
  fields      = file("${path.module}/day.json")
}
