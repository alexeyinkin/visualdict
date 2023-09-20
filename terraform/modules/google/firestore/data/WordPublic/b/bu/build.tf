resource "google_firestore_document" "build" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "build"
  fields      = file("${path.module}/build.json")
}
