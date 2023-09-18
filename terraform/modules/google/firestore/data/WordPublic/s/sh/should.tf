resource "google_firestore_document" "should" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "should"
  fields      = file("${path.module}/should.json")
}
