resource "google_firestore_document" "some" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "some"
  fields      = file("${path.module}/some.json")
}
