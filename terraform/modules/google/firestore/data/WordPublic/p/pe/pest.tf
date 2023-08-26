resource "google_firestore_document" "pest" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "pest"
  fields      = file("${path.module}/pest.json")
}
