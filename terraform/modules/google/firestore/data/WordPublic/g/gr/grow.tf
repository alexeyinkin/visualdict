resource "google_firestore_document" "grow" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "grow"
  fields      = file("${path.module}/grow.json")
}
