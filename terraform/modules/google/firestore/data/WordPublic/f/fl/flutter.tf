resource "google_firestore_document" "flutter" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "flutter"
  fields      = file("${path.module}/flutter.json")
}
