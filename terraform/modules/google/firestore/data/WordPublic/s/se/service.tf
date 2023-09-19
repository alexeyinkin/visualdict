resource "google_firestore_document" "service" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "service"
  fields      = file("${path.module}/service.json")
}
