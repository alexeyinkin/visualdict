resource "google_firestore_document" "there" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "there"
  fields      = file("${path.module}/there.json")
}
