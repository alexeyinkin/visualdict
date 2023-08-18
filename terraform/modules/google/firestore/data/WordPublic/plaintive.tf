resource "google_firestore_document" "plaintive" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "plaintive"
  fields      = file("${path.module}/plaintive.json")
}
