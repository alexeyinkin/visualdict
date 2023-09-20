resource "google_firestore_document" "education" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "education"
  fields      = file("${path.module}/education.json")
}
