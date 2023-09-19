resource "google_firestore_document" "ever" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "ever"
  fields      = file("${path.module}/ever.json")
}
