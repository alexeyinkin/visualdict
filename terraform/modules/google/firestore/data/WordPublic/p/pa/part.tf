resource "google_firestore_document" "part" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "part"
  fields      = file("${path.module}/part.json")
}
