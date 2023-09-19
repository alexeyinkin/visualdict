resource "google_firestore_document" "door" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "door"
  fields      = file("${path.module}/door.json")
}
