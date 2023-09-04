resource "google_firestore_document" "vestigial" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "vestigial"
  fields      = file("${path.module}/vestigial.json")
}
