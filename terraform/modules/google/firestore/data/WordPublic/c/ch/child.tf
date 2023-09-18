resource "google_firestore_document" "child" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "child"
  fields      = file("${path.module}/child.json")
}
