resource "google_firestore_document" "pick" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "pick"
  fields      = file("${path.module}/pick.json")
}
