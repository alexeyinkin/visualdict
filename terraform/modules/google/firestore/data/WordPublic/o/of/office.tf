resource "google_firestore_document" "office" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "office"
  fields      = file("${path.module}/office.json")
}
