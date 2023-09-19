resource "google_firestore_document" "food" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "food"
  fields      = file("${path.module}/food.json")
}
