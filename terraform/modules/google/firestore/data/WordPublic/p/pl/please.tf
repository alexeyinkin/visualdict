resource "google_firestore_document" "please" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "please"
  fields      = file("${path.module}/please.json")
}
