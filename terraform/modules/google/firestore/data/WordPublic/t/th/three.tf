resource "google_firestore_document" "three" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "three"
  fields      = file("${path.module}/three.json")
}
