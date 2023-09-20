resource "google_firestore_document" "sprightly" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "sprightly"
  fields      = file("${path.module}/sprightly.json")
}
