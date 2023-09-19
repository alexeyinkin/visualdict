resource "google_firestore_document" "provide" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "provide"
  fields      = file("${path.module}/provide.json")
}
