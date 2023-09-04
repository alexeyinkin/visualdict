resource "google_firestore_document" "about" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "about"
  fields      = file("${path.module}/about.json")
}
