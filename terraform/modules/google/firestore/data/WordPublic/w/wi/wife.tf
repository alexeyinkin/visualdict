resource "google_firestore_document" "wife" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "wife"
  fields      = file("${path.module}/wife.json")
}
