resource "google_firestore_document" "pass" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "pass"
  fields      = file("${path.module}/pass.json")
}
