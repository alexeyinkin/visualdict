resource "google_firestore_document" "student" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "student"
  fields      = file("${path.module}/student.json")
}
