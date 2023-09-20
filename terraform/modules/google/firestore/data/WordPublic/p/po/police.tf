resource "google_firestore_document" "police" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "police"
  fields      = file("${path.module}/police.json")
}
