resource "google_firestore_document" "lead" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "lead"
  fields      = file("${path.module}/lead.json")
}
