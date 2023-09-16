resource "google_firestore_document" "stoic" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "stoic"
  fields      = file("${path.module}/stoic.json")
}
