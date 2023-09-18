resource "google_firestore_document" "school" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "school"
  fields      = file("${path.module}/school.json")
}
