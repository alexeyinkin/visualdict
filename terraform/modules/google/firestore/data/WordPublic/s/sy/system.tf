resource "google_firestore_document" "system" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "system"
  fields      = file("${path.module}/system.json")
}
