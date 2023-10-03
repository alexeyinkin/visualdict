resource "google_firestore_document" "prowess" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "prowess"
  fields      = file("${path.module}/prowess.json")
}
