resource "google_firestore_document" "room" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "room"
  fields      = file("${path.module}/room.json")
}
