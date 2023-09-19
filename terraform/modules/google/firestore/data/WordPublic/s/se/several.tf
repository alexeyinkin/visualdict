resource "google_firestore_document" "several" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "several"
  fields      = file("${path.module}/several.json")
}
