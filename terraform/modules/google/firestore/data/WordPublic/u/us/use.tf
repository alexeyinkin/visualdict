resource "google_firestore_document" "use" {
  project     = var.PROJECT
  collection  = var.FIRESTORE_COLLECTION_WORD_PUBLIC
  document_id = "use"
  fields      = file("${path.module}/use.json")
}
