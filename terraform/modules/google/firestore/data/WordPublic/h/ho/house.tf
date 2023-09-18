resource "google_firestore_document" "house" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "house"
  fields      = file("${path.module}/house.json")
}
