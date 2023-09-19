resource "google_firestore_document" "later" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "later"
  fields      = file("${path.module}/later.json")
}
