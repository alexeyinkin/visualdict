resource "google_firestore_document" "brouhaha" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "brouhaha"
  fields      = file("${path.module}/brouhaha.json")
}
