resource "google_firestore_document" "inclement" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "inclement"
  fields      = file("${path.module}/inclement.json")
}
