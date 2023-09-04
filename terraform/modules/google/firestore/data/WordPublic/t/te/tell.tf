resource "google_firestore_document" "tell" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "tell"
  fields      = file("${path.module}/tell.json")
}
