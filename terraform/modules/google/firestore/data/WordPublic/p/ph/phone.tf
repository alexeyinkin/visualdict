resource "google_firestore_document" "phone" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "phone"
  fields      = file("${path.module}/phone.json")
}
