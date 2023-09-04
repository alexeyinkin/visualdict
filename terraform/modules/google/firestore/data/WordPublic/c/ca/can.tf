resource "google_firestore_document" "can" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "can"
  fields      = file("${path.module}/can.json")
}
