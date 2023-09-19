resource "google_firestore_document" "kill" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "kill"
  fields      = file("${path.module}/kill.json")
}
