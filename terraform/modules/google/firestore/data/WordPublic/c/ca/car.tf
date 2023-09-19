resource "google_firestore_document" "car" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "car"
  fields      = file("${path.module}/car.json")
}
