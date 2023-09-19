resource "google_firestore_document" "course" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "course"
  fields      = file("${path.module}/course.json")
}
