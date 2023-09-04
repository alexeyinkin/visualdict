resource "google_firestore_document" "then" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "then"
  fields      = file("${path.module}/then.json")
}
