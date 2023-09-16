resource "google_firestore_document" "anguish" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "anguish"
  fields      = file("${path.module}/anguish.json")
}
