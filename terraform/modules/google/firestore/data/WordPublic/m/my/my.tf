resource "google_firestore_document" "my" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "my"
  fields      = file("${path.module}/my.json")
}
