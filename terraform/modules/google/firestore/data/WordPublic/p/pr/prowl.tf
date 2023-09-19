resource "google_firestore_document" "prowl" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "prowl"
  fields      = file("${path.module}/prowl.json")
}
