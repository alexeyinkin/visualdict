resource "google_firestore_document" "upend" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "upend"
  fields      = file("${path.module}/upend.json")
}
