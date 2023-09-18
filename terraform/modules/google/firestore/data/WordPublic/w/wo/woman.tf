resource "google_firestore_document" "woman" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "woman"
  fields      = file("${path.module}/woman.json")
}
