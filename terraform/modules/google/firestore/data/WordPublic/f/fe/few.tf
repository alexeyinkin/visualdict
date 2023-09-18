resource "google_firestore_document" "few" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "few"
  fields      = file("${path.module}/few.json")
}
