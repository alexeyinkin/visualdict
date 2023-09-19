resource "google_firestore_document" "around" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "around"
  fields      = file("${path.module}/around.json")
}
