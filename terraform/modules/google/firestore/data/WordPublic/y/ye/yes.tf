resource "google_firestore_document" "yes" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "yes"
  fields      = file("${path.module}/yes.json")
}
