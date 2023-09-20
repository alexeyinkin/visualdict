resource "google_firestore_document" "late" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "late"
  fields      = file("${path.module}/late.json")
}
