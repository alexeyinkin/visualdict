resource "google_firestore_document" "experience" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "experience"
  fields      = file("${path.module}/experience.json")
}
