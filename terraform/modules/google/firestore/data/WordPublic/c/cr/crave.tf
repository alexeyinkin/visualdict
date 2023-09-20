resource "google_firestore_document" "crave" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "crave"
  fields      = file("${path.module}/crave.json")
}
