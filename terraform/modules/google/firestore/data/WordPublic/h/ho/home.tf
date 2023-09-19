resource "google_firestore_document" "home" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "home"
  fields      = file("${path.module}/home.json")
}
