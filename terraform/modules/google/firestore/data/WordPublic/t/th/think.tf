resource "google_firestore_document" "think" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "think"
  fields      = file("${path.module}/think.json")
}
