resource "google_firestore_document" "program" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "program"
  fields      = file("${path.module}/program.json")
}
