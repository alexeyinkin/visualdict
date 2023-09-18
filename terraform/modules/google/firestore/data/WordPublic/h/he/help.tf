resource "google_firestore_document" "help" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "help"
  fields      = file("${path.module}/help.json")
}
