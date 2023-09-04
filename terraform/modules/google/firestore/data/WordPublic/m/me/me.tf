resource "google_firestore_document" "me" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "me"
  fields      = file("${path.module}/me.json")
}
