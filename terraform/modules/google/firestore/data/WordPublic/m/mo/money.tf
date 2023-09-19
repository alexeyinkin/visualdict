resource "google_firestore_document" "money" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "money"
  fields      = file("${path.module}/money.json")
}
