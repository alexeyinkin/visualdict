resource "google_firestore_document" "often" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "often"
  fields      = file("${path.module}/often.json")
}
