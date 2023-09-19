resource "google_firestore_document" "pay" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "pay"
  fields      = file("${path.module}/pay.json")
}
