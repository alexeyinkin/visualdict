resource "google_firestore_document" "baby" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "baby"
  fields      = file("${path.module}/baby.json")
}
