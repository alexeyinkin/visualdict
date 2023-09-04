resource "google_firestore_document" "want" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "want"
  fields      = file("${path.module}/want.json")
}
