resource "google_firestore_document" "out" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "out"
  fields      = file("${path.module}/out.json")
}
