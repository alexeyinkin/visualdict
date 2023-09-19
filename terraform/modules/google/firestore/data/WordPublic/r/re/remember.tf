resource "google_firestore_document" "remember" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "remember"
  fields      = file("${path.module}/remember.json")
}
