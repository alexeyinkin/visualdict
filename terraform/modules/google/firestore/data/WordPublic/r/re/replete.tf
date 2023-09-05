resource "google_firestore_document" "replete" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "replete"
  fields      = file("${path.module}/replete.json")
}
