resource "google_firestore_document" "all" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "all"
  fields      = file("${path.module}/all.json")
}
