resource "google_firestore_document" "illustrious" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "illustrious"
  fields      = file("${path.module}/illustrious.json")
}
