resource "google_firestore_document" "college" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "college"
  fields      = file("${path.module}/college.json")
}
