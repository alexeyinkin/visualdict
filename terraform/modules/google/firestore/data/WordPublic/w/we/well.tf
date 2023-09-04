resource "google_firestore_document" "well" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "well"
  fields      = file("${path.module}/well.json")
}
