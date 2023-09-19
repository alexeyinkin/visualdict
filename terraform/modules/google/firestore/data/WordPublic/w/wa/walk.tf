resource "google_firestore_document" "walk" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "walk"
  fields      = file("${path.module}/walk.json")
}
