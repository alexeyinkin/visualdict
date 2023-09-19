resource "google_firestore_document" "national" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "national"
  fields      = file("${path.module}/national.json")
}
