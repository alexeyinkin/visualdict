resource "google_firestore_document" "leave" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "leave"
  fields      = file("${path.module}/leave.json")
}
