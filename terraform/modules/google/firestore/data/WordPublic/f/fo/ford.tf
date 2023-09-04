resource "google_firestore_document" "ford" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "ford"
  fields      = file("${path.module}/ford.json")
}
