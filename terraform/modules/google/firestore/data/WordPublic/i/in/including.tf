resource "google_firestore_document" "including" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "including"
  fields      = file("${path.module}/including.json")
}
