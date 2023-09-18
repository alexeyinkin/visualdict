resource "google_firestore_document" "may" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "may"
  fields      = file("${path.module}/may.json")
}
