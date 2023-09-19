resource "google_firestore_document" "during" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "during"
  fields      = file("${path.module}/during.json")
}
