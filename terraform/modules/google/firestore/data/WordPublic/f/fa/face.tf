resource "google_firestore_document" "face" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "face"
  fields      = file("${path.module}/face.json")
}
