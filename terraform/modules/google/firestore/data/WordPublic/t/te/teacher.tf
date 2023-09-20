resource "google_firestore_document" "teacher" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "teacher"
  fields      = file("${path.module}/teacher.json")
}
