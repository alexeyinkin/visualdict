resource "google_firestore_document" "from" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "from"
  fields      = file("${path.module}/from.json")
}
